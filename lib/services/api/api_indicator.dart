import 'package:graphql/client.dart';

import '../../models/response.dart';
import 'api_services.dart';

class APIIndicator {
  static Future getApartmentIndicator(int year, int month) async {
    var query = '''
    mutation (\$year:Float,\$month:Float){
    response: indicator_mobile_e_get_apartment_indicator_by_month_year (year: \$year,month: \$month ) {
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
}
