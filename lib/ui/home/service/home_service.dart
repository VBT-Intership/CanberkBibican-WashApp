import 'package:flutter_wash_app/core/base/service/base_service.dart';
import 'package:flutter_wash_app/core/constants/constants.dart';
import 'package:flutter_wash_app/ui/home/model/discountlist_model.dart';

import 'IHome_service.dart';

class HomeService extends IHomeService {
  @override
  Future<List<DiscountListModel>> getDiscountList() async {
    return await httpGet<DiscountListModel>(
        AppConstants.DISCOUNTLIST_URL, DiscountListModel());
  }
}
