import 'package:flutter_wash_app/core/base/model/base_model.dart';

class DiscountListModel extends BaseModel<DiscountListModel> {
  String category;
  String count;
  String imgurl;

  DiscountListModel({this.category, this.count, this.imgurl});

  DiscountListModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    count = json['count'];
    imgurl = json['imgurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['count'] = this.count;
    data['imgurl'] = this.imgurl;
    return data;
  }

  @override
  DiscountListModel fromJson(Map<String, Object> json) {
    return DiscountListModel.fromJson(json);
  }
}
