import 'package:flutter/material.dart';
import 'package:flutter_wash_app/ui/payment/viewmodel/payment_viewmodel.dart';

class PaymentView extends PaymentViewModel {
  //------Sizes-----//

  double get paymentPadding => MediaQuery.of(context).size.width * 0.05;
  double get paymentButtonSize => MediaQuery.of(context).size.width * 0.08;

  //Title
  double get titleSize => MediaQuery.of(context).size.width * 0.1;

  //------Colors-----//
  Color get appBarIconColor => Colors.lightBlue[900];
  Color get titleColor => Colors.blue[700];

  //Texts
  String get paymentTitleText => "SELECTED ITEMS";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: paymentAppBar(),
      body: paymentBody(),
    );
  }

  AppBar paymentAppBar() {
    return AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
        leading: paymentAppBarLeftIcon(context),
        actions: [paymentAppBarRightIcon(context)]);
  }

  IconButton paymentAppBarLeftIcon(BuildContext context) {
    return IconButton(
        icon: new Icon(Icons.bubble_chart,
            color: appBarIconColor, size: paymentButtonSize),
        onPressed: () => Navigator.of(context).pop(null));
  }

  IconButton paymentAppBarRightIcon(BuildContext context) {
    return IconButton(
        icon: new Icon(Icons.search,
            color: appBarIconColor, size: paymentButtonSize),
        onPressed: () => Navigator.of(context).pop(null));
  }

  Padding paymentBody() {
    return Padding(
        padding: EdgeInsets.all(paymentPadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(flex: 20, child: paymentTitle()),
        ]));
  }

  Text paymentTitle() {
    return Text(paymentTitleText,
        style: TextStyle(color: titleColor, fontSize: titleSize));
  }
}
