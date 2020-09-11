import 'package:flutter_wash_app/ui/payment/model/discountlist_model.dart';

abstract class IPaymentService {
  Future<List<DiscountListModel>> getDiscountList();
}
