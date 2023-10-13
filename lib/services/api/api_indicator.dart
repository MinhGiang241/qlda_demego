import 'package:graphql/client.dart';

import '../../models/response.dart';
import 'api_services.dart';

class APIIndicator {
  static Future getApartmentIndicator(
    int year,
    int month,
    int skip,
    int limit,
  ) async {
    var query = '''
 mutation (\$year:Float,\$month:Float,\$skip:Float,\$limit:Float){
    response: indicator_mobile_e_get_apartment_indicator_by_month_year (year: \$year,month: \$month,skip: \$skip,limit: \$limit ) {
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
      bool isElectric, String? employeeId, int month, int year) async {
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

  static Future saveOfflineIndicatorData(
    List<Map<String, dynamic>>? electric,
    List<Map<String, dynamic>>? water,
    String baseUrl,
  ) async {
    var query = '''
mutation (\$water:Dictionary,\$electric:Dictionary){
    response: indicator_mobile_save_offline_indicator_daa (water: \$water,electric: \$electric ) {
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
    //final results = await ApiService.shared.mutationhqlQuery(options);
    var graphqlLink = HttpLink('$baseUrl/graphql');
    final GraphQLClient graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: graphqlLink,
    );
    var results = await graphQLClient.mutate(options);
  }
}
