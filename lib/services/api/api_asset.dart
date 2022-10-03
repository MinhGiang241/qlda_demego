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
			code
			ref_supplierId_SupplierDto{
				_id
				name
			}
			ref_unitId_UnitDto {
				_id
				name
				display_name
			}
			ref_FloorAssets_assetIdDto{
				_id
				display_name
				floorId
			}
			ref_assetTypeId_AssetTypeDto{
				_id
				name
				display_name
				
			}
			ref_BuildingAssets_assetIdDto{
				_id
				display_name
			}
			ref_BuildingAssets_assetIdDto{
				_id
				display_name
			}
			ref_ApartmentAssets_assetIdDto{
				_id
				display_name
			}
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

    final QueryOptions options = QueryOptions(
      document: gql(queryAsetList),
      // variables: const {"filter": '', "custominput": ""},
    );
    try {
      final data =
          await ApiService.shared.graphqlQuery(options).catchError((e) {});

      return data;
    } catch (e) {
      throw (e);
    }
  }
}
