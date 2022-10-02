import 'package:graphql/client.dart';

import '../../models/asset_model.dart';
import 'api_services.dart';

class ApiAsset {
  static Future<dynamic> getAssetList() async {
    var queryAsetList = '''
  query ( \$filter: GeneralCollectionFilterInput,\$custominput: Dictionary){
	query_Assets_dto(filter:  \$filter, custominput:\$custominput) {
		code
		message
		data {
			_id
			display_name
			name
			amount
			createdTime
			updatedTime
			assetTypeId
			supplierId
			manage
			describe
			inventory
		}
	}
  } 
  ''';
    var assetList = [];
    final QueryOptions options = QueryOptions(
      document: gql(queryAsetList),
      // variables: const {"filter": '', "custominput": ""},
    );
    final data = await ApiService.shared.graphqlQuery(options);

    data['query_Assets_dto']['data'].forEach(
      (e) {
        print(e);
        assetList.add(Asset.fromJson(e));
      },
    );

    return assetList;
  }
}
