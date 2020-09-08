import 'package:flutter_wash_app/ui/home/model/discountlist_model.dart';

abstract class IHomeService {
  Future<List<DiscountListModel>> getDiscountList();
}
