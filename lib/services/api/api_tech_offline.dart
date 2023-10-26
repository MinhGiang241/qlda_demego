import 'package:graphql/client.dart';
import 'package:qlda_demego/services/api/api_services.dart';

import '../../models/response.dart';

class APITechOffline {
  static Future getAllApartments() async {
    var query = '''
    mutation {
    response: apartment_mobile_e_get_all_aprtment  {
        code
        message
        data
    }
}
    ''';
    final MutationOptions options = MutationOptions(
      document: gql(query),
    );

    final results = await ApiService.shared.mutationhqlQuery(options);

    var res = ResponseModule.fromJson(results);

    if (res.response.code != 0) {
      throw (res.response.message ?? '');
    } else {
      return res.response.data;
    }
  }
}
