import 'package:flutter/material.dart';
import 'package:flutter_wash_app/ui/order/view/order.dart';

abstract class OrderViewModel extends State<Order> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
