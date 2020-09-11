import 'package:flutter/material.dart';
import 'package:flutter_wash_app/ui/payment/model/discountlist_model.dart';
import 'package:flutter_wash_app/ui/payment/service/IPayment_service.dart';
import 'package:flutter_wash_app/ui/payment/service/payment_service.dart';
import 'package:flutter_wash_app/ui/payment/view/payment.dart';

abstract class PaymentViewModel extends State<Payment> {
  bool isLoading = false;
  List<DiscountListModel> disCountList = [];
  IPaymentService paymentService;

  @override
  void initState() {
    super.initState();
    paymentService = PaymentService();
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
    disCountList = await paymentService.getDiscountList();
  }
}
