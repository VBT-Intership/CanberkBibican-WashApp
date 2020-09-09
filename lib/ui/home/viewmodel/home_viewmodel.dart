import 'package:flutter/material.dart';
import 'package:flutter_wash_app/ui/home/model/discountlist_model.dart';
import 'package:flutter_wash_app/ui/home/service/IHome_service.dart';
import 'package:flutter_wash_app/ui/home/service/home_service.dart';
import 'package:flutter_wash_app/ui/home/view/home.dart';

abstract class HomeViewModel extends State<Home> {
  bool isLoading = false;
  List<DiscountListModel> disCountList = [];
  IHomeService homeService;

  @override
  void initState() {
    super.initState();
    homeService = HomeService();
    callItems();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> callItems() async {
    changeLoading();
    await getDiscountList();
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> getDiscountList() async {
    disCountList = await homeService.getDiscountList();
  }
}
