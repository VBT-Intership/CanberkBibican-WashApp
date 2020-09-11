import 'package:flutter_wash_app/core/base/service/base_service.dart';
import 'package:flutter_wash_app/core/constants/constants.dart';
import 'package:flutter_wash_app/ui/payment/model/discountlist_model.dart';

import 'IPayment_service.dart';

class PaymentService extends IPaymentService {
  @override
  Future<List<DiscountListModel>> getDiscountList() async {
    return await httpGet<DiscountListModel>(
        AppConstants.DISCOUNTLIST_URL, DiscountListModel());
  }
}
