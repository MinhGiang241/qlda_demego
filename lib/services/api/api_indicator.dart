import 'dart:io';

import 'package:dio/dio.dart';
import 'package:graphql/client.dart';

import '../../models/response.dart';
import 'api_services.dart';

class APIIndicator {
  static Future getApartmentIndicator(
    int year,
    int month,
    int skip,
    int limit,
    String search,
  ) async {
    var query = '''
mutation (\$year:Float,\$month:Float,\$skip:Float,\$limit:Float,\$search:String){
    response: indicator_mobile_e_get_apartment_indicator_by_month_year (year: \$year,month: \$month,skip: \$skip,limit: \$limit,search: \$search ) {
        code
        message
        data
    }
}
        
        
        
  ''';

    final MutationOptions options = MutationOptions(
      document: gql(query),
      variables: {
        "year": year,
        'month': month,
        "skip": skip,
        'limit': limit,
        'search': search,
      },
    );
    final results = await ApiService.shared.mutationhqlQuery(options);

    var res = ResponseModule.fromJson(results);

    if (res.response.code != 0) {
      throw (res.response.message ?? "");
    } else {
      return res.response.data;
    }
  }

  static Future getApartmentIndicatorCount(
    bool isElectric,
    String? employeeId,
    int month,
    int year,
  ) async {
    var query = '''
mutation (\$isElectric:Boolean,\$employeeId:String,\$month:Float,\$year:Float){
    response: indicator_mobile_get_indicator_apartment_count_total (isElectric: \$isElectric,employeeId: \$employeeId,month: \$month,year: \$year ) {
        code
        message
        data
    }
}
        
        
  ''';

    final MutationOptions options = MutationOptions(
      document: gql(query),
      variables: {
        "year": year,
        'month': month,
        "isElectric": isElectric,
        'employeeId': employeeId,
      },
    );
    final results = await ApiService.shared.mutationhqlQuery(options);

    var res = ResponseModule.fromJson(results);

    if (res.response.code != 0) {
      throw (res.response.message ?? "");
    } else {
      return res.response.data;
    }
  }

  static Future saveIndicator(
    bool isElectric,
    Map<String, dynamic> data,
  ) async {
    var query = '''
 mutation (\$isElectric:Boolean,\$data:Dictionary){
    response: indicator_mobile_save_indicator (isElectric: \$isElectric,data: \$data ) {
        code
        message
        data
    }
}
        
  ''';

    final MutationOptions options = MutationOptions(
      document: gql(query),
      variables: {
        "isElectric": isElectric,
        'data': data,
      },
    );
    final results = await ApiService.shared.mutationhqlQuery(options);

    var res = ResponseModule.fromJson(results);

    if (res.response.code != 0) {
      throw (res.response.message ?? "");
    } else {
      return res.response.data;
    }
  }

  static Future saveManyIndicator(
    List<dynamic>? electric,
    List<dynamic>? water,
  ) async {
    var query = '''
mutation (\$water:Dictionary,\$electric:Dictionary){
    response: indicator_mobile_save_offline_indicator_data (water: \$water,electric: \$electric ) {
        code
        message
        data
    }
}
        
        
        
  ''';

    final MutationOptions options = MutationOptions(
      document: gql(query),
      variables: {
        "water": water,
        'electric': electric,
      },
    );
    final results = await ApiService.shared.mutationhqlQuery(options);

    var res = ResponseModule.fromJson(results);

    if (res.response.code != 0) {
      throw (res.response.message ?? "");
    } else {
      return res.response.data;
    }
  }

  static Future saveOfflineIndicatorData(
    List<dynamic>? electric,
    List<dynamic>? water,
    String baseUrl,
    String? accessToken,
  ) async {
    var query = '''
mutation (\$water:Dictionary,\$electric:Dictionary){
    response: indicator_mobile_save_offline_indicator_data (water: \$water,electric: \$electric ) {
        code
        message
        data
    }
}
    
  ''';
    Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));
    if (electric != null) {
      for (var i in electric) {
        var uploadImages = [];
        if (i['offline_image'] != null) {
          for (var j in i['offline_image']) {
            try {
              var file = File(j);
              if (file.lengthSync() >= 15728640) {
                continue;
              }
              final mpf = await MultipartFile.fromFile(j);
              final map = {
                'file': [mpf],
                'name': file.path.split('/').last,
              };
              final body = FormData.fromMap(map);
              var options = Options(
                headers: {
                  'Authorization': "Bearer ${accessToken}",
                  "Accept": "application/json",
                },
              );
              var path =
                  baseUrl.replaceAll("baseUrl", "headless/stream/upload");
              final data = await _dio.post(
                path,
                data: body,
                options: options,
              );
              if (data.data != null) {
                uploadImages.add(data.data.toString());
              }
            } catch (e) {
              continue;
            }
          }
        }
        if (uploadImages.isNotEmpty) {
          if (i['image'] == null) {
            i['image'] = uploadImages;
          } else {
            i['image'] = i['image'] + uploadImages;
          }
        }
      }
    }

    if (water != null) {
      for (var i in water) {
        var uploadImages = [];
        if (i['offline_image'] != null) {
          for (var j in i['offline_image']) {
            try {
              var file = File(j);
              if (file.lengthSync() >= 15728640) {
                continue;
              }
              final mpf = await MultipartFile.fromFile(j);
              final map = {
                'file': [mpf],
                'name': file.path.split('/').last,
              };
              final body = FormData.fromMap(map);
              var options = Options(
                headers: {
                  'Authorization': "Bearer ${accessToken}",
                  "Accept": "application/json",
                },
              );
              var path =
                  baseUrl.replaceAll("baseUrl", "headless/stream/upload");
              final data = await _dio.post(
                path,
                data: body,
                options: options,
              );
              if (data.data != null) {
                uploadImages.add(data.data.toString());
              }
            } catch (e) {
              continue;
            }
          }
        }
        if (uploadImages.isNotEmpty) {
          if (i['image'] == null) {
            i['image'] = uploadImages;
          } else {
            i['image'] = i['image'] + uploadImages;
          }
        }
      }
    }

    final MutationOptions options = MutationOptions(
      document: gql(query),
      variables: {
        "water": water,
        'electric': electric,
      },
    );
    //final results = await ApiService.shared.mutationhqlQuery(options);
    var graphqlLink = HttpLink('$baseUrl/graphql');
    late AuthLink authLink;
    if (accessToken == null) {
      authLink = AuthLink(getToken: () => 'Bearer ');
    } else {
      authLink = AuthLink(
        getToken: () async => 'Bearer ${accessToken}',
      );
    }
    Link link = authLink.concat(graphqlLink);
    final GraphQLClient graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
    var results = await graphQLClient.mutate(options);
  }
}
