import 'package:flutter/material.dart';
import 'package:flutter_wash_app/ui/order/viewmodel/order_viewmodel.dart';

class OrderView extends OrderViewModel {
  //------Sizes-----//

  double get orderPadding => MediaQuery.of(context).size.width * 0.05;
  double get orderButtonSize => MediaQuery.of(context).size.width * 0.08;

  //OrderCard
  double get orderCardWidth => MediaQuery.of(context).size.width * 0.2;
  double get orderCardHeight => MediaQuery.of(context).size.width * 0.2;
  double get orderCardRadius => MediaQuery.of(context).size.width * 0.04;
  double get orderCardTextSize => 10;
  double get orderCardiconSize => 25;

  //Title
  double get titleSize => MediaQuery.of(context).size.width * 0.05;

  //------Colors-----//
  Color get appBarIconColor => Colors.lightBlue[900];
  Color get titleColor => Colors.blue[700];

  //Texts
  String get orderTitleText => "CATEGORIES";

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
        icon: new Icon(Icons.keyboard_arrow_left,
            color: appBarIconColor, size: orderButtonSize),
        onPressed: () => Navigator.of(context).pop(null));
  }

  IconButton paymentAppBarRightIcon(BuildContext context) {
    return IconButton(
        icon: new Icon(Icons.message,
            color: appBarIconColor, size: orderButtonSize),
        onPressed: () => Navigator.of(context).pop(null));
  }

  Padding paymentBody() {
    return Padding(
        padding: EdgeInsets.all(orderPadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(flex: 10, child: paymentTitle()),
          Expanded(flex: 20, child: orderCardList()),
          Expanded(flex: 70, child: Text("data")),
        ]));
  }

  Text paymentTitle() {
    return Text(orderTitleText,
        style: TextStyle(color: titleColor, fontSize: titleSize));
  }

  Container orderCardList() {
    return Container(
      child: ListView.builder(
          itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Row(
                children: [
                  orderCard(orderCardIcon(Icons.ac_unit), "Washing"),
                  orderCard(orderCardIcon(Icons.access_alarm), "Ironing"),
                  orderCard(orderCardIcon(Icons.ac_unit), "Washing"),
                  orderCard(orderCardIcon(Icons.access_alarm), "Ironing"),
                  orderCard(orderCardIcon(Icons.ac_unit), "Washing"),
                  orderCard(orderCardIcon(Icons.access_alarm), "Ironing"),
                  orderCard(orderCardIcon(Icons.ac_unit), "Washing"),
                  orderCard(orderCardIcon(Icons.access_alarm), "Ironing"),
                ],
              )),
    );
  }

  Center orderCard(Icon icon, String title) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(orderCardRadius)),
        child: Container(
          width: orderCardWidth,
          height: orderCardHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(10), child: icon),
              Text(title,
                  style: TextStyle(
                      fontSize: orderCardTextSize, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }

  Icon orderCardIcon(IconData icon) {
    return Icon(
      icon,
      size: orderCardiconSize,
    );
  }
}
