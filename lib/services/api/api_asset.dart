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
      assetTypeId
			unitId
			tenantId
		}
	}
  } 
  ''';

    var filter = {
      "collection": "asset",
      "postQueryBeforePaging": false,
      "group": {
        "op": "AND",
        "children": [],
        "operation": "~i",
        "rawFilter": false
      },
      "skip": 0,
      "limit": 50,
      "withRecords": false,
      "inline": false,
      "is_debug": false,
      "unionLimit": 10
    };

    final QueryOptions options = QueryOptions(
      document: gql(queryAsetList),
      variables: {"filter": filter},
    );
    try {
      final data =
          await ApiService.shared.graphqlQuery(options).catchError((e) {});

      return data;
    } catch (e) {
      throw (e);
    }
  }

  static Future<dynamic> updateAsset(Asset asset) async {
    var mutationAssetUpdate = '''
      mutation(\$data:AssetInputDto){
    save_Asset_dto(data:\$data){
      code
      message
      data {
        _id
      }
    }
  }
    ''';

    var filter = {
      "filter": {
        "postQueryBeforePaging": false,
        "group": {
          "op": "AND",
          "children": [],
          "operation": "~i",
          "rawFilter": false
        },
        "skip": 0,
        "limit": 50,
        "withRecords": false,
        "inline": false,
        "is_debug": false,
        "unionLimit": 10
      }
    };

    final MutationOptions options = MutationOptions(
      document: gql(mutationAssetUpdate),
      variables: {"filter": filter, "data": asset.toJson()},
    );

    final data = await ApiService.shared.mutationhqlQuery(options);
    return data;
  }

  static Future<dynamic> getAssetTypeList() async {
    var queryGetAssetTypeList = '''
      query (\$filter: GeneralCollectionFilterInput) {
    query_AssetTypes_dto(filter: \$filter){
      code
      message
      data {
        _id
        name
        display_name
        ref_Asset_assetTypeIdDto{
          _id
          name
          
        }
      }
    }
  }
    ''';

    var filter = {
      "postQueryBeforePaging": false,
      "group": {
        "op": "AND",
        "children": [],
        "operation": "~i",
        "rawFilter": false
      },
      "skip": 0,
      "limit": 50,
      "withRecords": false,
      "inline": false,
      "is_debug": false,
      "unionLimit": 10
    };

    final QueryOptions options = QueryOptions(
      document: gql(queryGetAssetTypeList),
      variables: {"filter": filter},
    );

    final data = await ApiService.shared.graphqlQuery(options);
    return data;
  }

  static Future<dynamic> getUnitList() async {
    var queryGetUnitList = '''
    query (\$filter: GeneralCollectionFilterInput){
	query_Units_dto(filter:\$filter){
		message
		code
		data {
			_id
			display_name
			code
			name
			describe
			ref_Asset_unitIdDto{
				display_name
				_id
				
			}
		}
	}
}
  ''';

    var filter = {
      "postQueryBeforePaging": false,
      "group": {
        "op": "AND",
        "children": [],
        "operation": "~i",
        "rawFilter": false
      },
      "skip": 0,
      "limit": 50,
      "withRecords": false,
      "inline": false,
      "is_debug": false,
      "unionLimit": 10
    };

    final QueryOptions options = QueryOptions(
      document: gql(queryGetUnitList),
      variables: {"filter": filter},
    );

    final data = await ApiService.shared.graphqlQuery(options);
    return data;
  }

  static Future<dynamic> getSupplierList() async {
    var queryGetSupplierList = '''
      query (\$filter: GeneralCollectionFilterInput){
    query_Suppliers_dto(filter:\$filter){
      code
      message
      data {
        _id
        name
        display_name
        code
        ref_Asset_supplierIdDto {
          _id
          name
        }
      }
    }
  }
  ''';

    var filter = {
      "postQueryBeforePaging": false,
      "group": {
        "op": "AND",
        "children": [],
        "operation": "~i",
        "rawFilter": false
      },
      "skip": 0,
      "limit": 50,
      "withRecords": false,
      "inline": false,
      "is_debug": false,
      "unionLimit": 10
    };

    final QueryOptions options = QueryOptions(
      document: gql(queryGetSupplierList),
      variables: {"filter": filter},
    );

    final data = await ApiService.shared.graphqlQuery(options);
    return data;
  }
}
