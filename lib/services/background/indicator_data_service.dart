import '../api/prf_data.dart';

class indicatorDataService {
  indicatorDataService shared = indicatorDataService();
  Future getDataIndicatorFromBox() async {
    var data = await PrfData.shared.getIndicator('');
  }
}
