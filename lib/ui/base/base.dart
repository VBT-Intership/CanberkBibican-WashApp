import 'package:flutter/material.dart';
import 'package:flutter_wash_app/ui/home/view/home.dart';
import 'package:flutter_wash_app/ui/order/view/order.dart';
import 'package:flutter_wash_app/ui/payment/view/payment.dart';

class Base extends StatefulWidget {
  Base({Key key}) : super(key: key);

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), Order(), Payment(), Payment()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: navigationBar(context),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
//Global widget olarak düzenlenicek

  Padding navigationBar(BuildContext context) {
    //------Sizes-----//

    double navBarButtonSize = MediaQuery.of(context).size.width * 0.08;
    double navBarRadius = MediaQuery.of(context).size.width * 0.1;
    double navBarPadding = MediaQuery.of(context).size.width * 0.05;

    //------Colors-----//
    Color navBarColor = Colors.white;
    Color navUnSelectedColor = Colors.grey[400];
    Color navSelectedColor = Colors.blue[700];

    //SizedBoxes
    SizedBox zeroHeightSizedBox = SizedBox(height: 0);

    return Padding(
      padding: EdgeInsets.only(
          left: navBarPadding, right: navBarPadding, bottom: navBarPadding),
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: navBarColor),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(navBarRadius),
          child: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: _currentIndex == 0
                        ? navSelectedColor
                        : navUnSelectedColor,
                    size: navBarButtonSize,
                  ),
                  title: zeroHeightSizedBox),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.comment,
                    color: _currentIndex == 1
                        ? navSelectedColor
                        : navUnSelectedColor,
                    size: navBarButtonSize,
                  ),
                  title: zeroHeightSizedBox),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.payment,
                    color: _currentIndex == 2
                        ? navSelectedColor
                        : navUnSelectedColor,
                    size: navBarButtonSize,
                  ),
                  title: zeroHeightSizedBox),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: _currentIndex == 3
                        ? navSelectedColor
                        : navUnSelectedColor,
                    size: navBarButtonSize,
                  ),
                  title: zeroHeightSizedBox),
            ],
          ),
        ),
      ),
    );
  }
}
