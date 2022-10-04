// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:qlda_demego/constant/api_constant.dart';
import 'package:qlda_demego/generated/intl/messages_vi.dart';

import '../../constant/constants.dart';
import 'package:dio/dio.dart';
import 'package:graphql/client.dart';

import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:path_provider/path_provider.dart';

import '../../generated/l10n.dart';
import '../../utils/error_handler.dart';

typedef OnSendProgress = Function(int, int);
typedef OnError = Function(ErrorHandle);

class ApiService {
  static ApiService shared = ApiService();

  final Dio _dio =
      Dio(BaseOptions(baseUrl: '${ApiConstants.baseUrl}}/content/'));
  String tokenEndpointUrl = ApiConstants.authorizationEndpoint;
  String clientId = ApiConstants.clientId; //"importer";
  String secret = ApiConstants.clientSecret;
  String scope = ApiConstants.scope;

  String userName = '';
  String passWord = '';
  bool remember = false;

  final _graphqlLink = HttpLink(
    ApiConstants.baseUrl,
  );

  Future<oauth2.Client?> getClient({
    required String username,
    required String password,
    OnError? onError,
    bool remmember = false,
  }) async {
    userName = username;
    passWord = password;
    remmember = remmember;
    var client;
    if (remmember) {
      client = await getExistClient();
    } else {
      await deleteCre();
    }
    // const client = null;

    if (client != null) {
      if (client.credentials.isExpired) {
        return await _getCre(username, password, onError, remmember);
      } else {
        return client;
      }
    } else {
      return await _getCre(username, password, onError, remmember);
    }
  }

  Future<oauth2.Client?> _getCre(
    String username,
    String password,
    OnError? onError,
    bool remember,
  ) async {
    final authorizationEndpoint = Uri.parse(tokenEndpointUrl);
    try {
      final cli = await oauth2.resourceOwnerPasswordGrant(
        authorizationEndpoint,
        username,
        password,
        identifier: clientId,
        secret: secret,
        scopes: [scope],
      );
      final path = await getApplicationDocumentsDirectory();
      final credentialsFile = File('${path.path}/credential.json');
      if (!remember) {
        await credentialsFile.writeAsString(cli.credentials.toJson());
      }

      return cli;
    } catch (e) {
      if (e.runtimeType.toString() == "AuthorizationException") {
        var authErr = ErrorHandle(
            msg: (e as oauth2.AuthorizationException).description!, code: 1);
        onError?.call(authErr);
      } else if (e.runtimeType.toString() == '_ClientSocketException') {
        onError?.call(ErrorHandle(code: 2));
      } else {
        onError?.call(
          ErrorHandle(
            code: 3,
          ),
        );
      }

      return null;
    }
  }

  Future<oauth2.Client?> getExistClient() async {
    final path = await getApplicationDocumentsDirectory();
    final credentialsFile = File('${path.path}/credential.json');
    var exists = await credentialsFile.exists();
    if (exists) {
      var credentials =
          oauth2.Credentials.fromJson(await credentialsFile.readAsString());
      return oauth2.Client(
        credentials,
        identifier: clientId,
        secret: '',
      );
    }
    return null;
  }

  deleteCre() async {
    final path = await getApplicationDocumentsDirectory();
    final credentialsFile = File('${path.path}/credential.json');
    if (await credentialsFile.exists()) {
      await credentialsFile.delete();
    }
  }

  Future<oauth2.Client> refresh(oauth2.Client client) async {
    final cli = await client.refreshCredentials();
    final path = await getApplicationDocumentsDirectory();
    final credentialsFile = File('${path.path}/credential.json');
    await credentialsFile.writeAsString(client.credentials.toJson());
    return cli;
  }

  Future<bool> isExpired() async {
    final client = await getExistClient();
    return client!.credentials.isExpired;
  }

  Future<String> getToken() async {
    final client = await getExistClient();
    return client!.credentials.accessToken;
  }

  Future<Map<String, dynamic>> postApi(
      {dynamic data,
      required String path,
      bool useToken = true,
      OnError? onError,
      OnSendProgress? onSendProgress}) async {
    Options? options;
    if (useToken) {
      var client = await getExistClient();
      if (client == null) {
        onError?.call(ErrorHandle(msg: ''));
      } else {
        //print(client.credentials.expiration);
        if (client.credentials.isExpired) {
          // print("EXPired");
          client = await refresh(client);
          log(client.credentials.accessToken);
          options = Options(
            headers: {
              'Authorization': "Bearer ${client.credentials.accessToken}",
              "Accept": "application/json"
            },
          );
        } else {
          //await client.refreshCredentials();
          log(client.credentials.accessToken);
          options = Options(
            headers: {
              'Authorization': "Bearer ${client.credentials.accessToken}",
              "Accept": "application/json"
            },
          );
        }
      }
    }
    try {
      final response = await _dio.post(path,
          data: data, options: options, onSendProgress: onSendProgress);
      return jsonDecode(response.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        try {
          log(e.response.toString());
          final data = jsonDecode(e.response.toString());
          return data;
        } catch (err) {
          return {"status": "error", "message": e.message};
        }
      } else {
        return {
          "status": "internet_error",
          "message": "network_connection_err"
        };
      }
    }
  }

  Future<Map<String, dynamic>> getApi(
      {required String path,
      bool useToken = true,
      Map<String, dynamic>? params,
      OnError? onError}) async {
    Options? options;
    if (useToken) {
      var client = await getExistClient();
      if (client == null) {
        onError?.call(ErrorHandle(msg: ''));
      } else {
        //print(client.credentials.expiration);
        if (client.credentials.isExpired) {
          // print("EXPired");
          client = await refresh(client);
          log(client.credentials.accessToken);
          options = Options(
            headers: {
              'Authorization': "Bearer ${client.credentials.accessToken}",
              "Accept": "application/json"
            },
          );
        } else {
          //await client.refreshCredentials();
          log(client.credentials.accessToken);
          options = Options(
            headers: {
              'Authorization': "Bearer ${client.credentials.accessToken}",
              "Accept": "application/json"
            },
          );
        }
      }
    }
    try {
      final response =
          await _dio.get(path, options: options, queryParameters: params);
      return jsonDecode(response.toString());
    } on DioError catch (e) {
      //print(e);
      if (e.response != null) {
        try {
          final data = jsonDecode(e.response.toString());
          return data;
        } catch (err) {
          return {"status": "error", "message": e.message};
        }
      } else {
        return {
          "status": "internet_error",
          "message": "network_connection_err"
        };
      }
    }
  }

  Future<Map<String, dynamic>> deleteApi(
      {dynamic data,
      required String path,
      bool useToken = true,
      OnError? onError,
      OnSendProgress? onSendProgress}) async {
    Options? options;
    if (useToken) {
      var client = await getExistClient();
      if (client == null) {
        onError?.call(ErrorHandle(msg: ''));
      } else {
        //print(client.credentials.expiration);
        if (client.credentials.isExpired) {
          // print("EXPired");
          client = await refresh(client);
          log(client.credentials.accessToken);
          options = Options(
            headers: {
              'Authorization': "Bearer ${client.credentials.accessToken}",
              "Accept": "application/json"
            },
          );
        } else {
          //await client.refreshCredentials();
          log(client.credentials.accessToken);
          options = Options(
            headers: {
              'Authorization': "Bearer ${client.credentials.accessToken}",
              "Accept": "application/json"
            },
          );
        }
      }
    }
    try {
      final response = await _dio.delete(path, data: data, options: options);

      return jsonDecode(response.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        try {
          log(e.response.toString());
          final data = jsonDecode(e.response.toString());
          return data;
        } catch (err) {
          return {"status": "error", "message": e.message};
        }
      } else {
        return {
          "status": "internet_error",
          "message": "network_connection_err"
        };
      }
    }
  }

  Future<GraphQLClient> getClientGraphQL({OnError? onError}) async {
    late AuthLink authLink;
    var client = await getExistClient();
    if (client == null) {
      onError?.call(ErrorHandle());
    } else {
      //print(client.credentials.expiration);
      if (client.credentials.isExpired) {
        // print("EXPired");
        client = await refresh(client);
        log(client.credentials.accessToken);
        authLink = AuthLink(
          getToken: () async => 'Bearer ${client?.credentials.accessToken}',
        );
      } else {
        //await client.refreshCredentials();
        log(client.credentials.accessToken);
        authLink = AuthLink(
          getToken: () async => 'Bearer ${client?.credentials.accessToken}',
        );
      }
    }
    Link link = authLink.concat(_graphqlLink);

    final GraphQLClient graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );

    return graphQLClient;
  }

  Future<Map<String, dynamic>> graphqlQuery(QueryOptions options) async {
    try {
      final cl = await getClientGraphQL();
      final result = await cl.query(options);

      if (result.data == null) {
        // throw ("network_connection_err");
        return {
          "status": "internet_error",
          "message": "network_connection_err"
        };
      }
      return result.data!;
    } catch (e) {
      return {"status": "error", "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> mutationhqlQuery(MutationOptions options) async {
    try {
      final cl = await getClientGraphQL();
      final result = await cl.mutate(options);

      if (result.data == null) {
        // throw ("network_connection_err");
        return {
          "status": "internet_error",
          "message": "network_connection_err"
        };
      }
      return result.data!;
    } catch (e) {
      return {"status": "error", "message": e.toString()};
    }
  }
}
