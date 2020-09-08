import 'package:flutter_wash_app/core/base/model/base_model.dart';

class DiscountListModel extends BaseModel<DiscountListModel> {
  String category;
  String count;

  DiscountListModel({this.category, this.count});

  DiscountListModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['count'] = this.count;
    return data;
  }

  @override
  DiscountListModel fromJson(Map<String, Object> json) {
    return DiscountListModel.fromJson(json);
  }
}
