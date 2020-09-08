import 'package:flutter/material.dart';
import 'package:flutter_wash_app/core/base/state/base_state.dart';
import 'package:flutter_wash_app/ui/home/viewmodel/home_viewmodel.dart';

class HomeView extends BaseState {
  HomeViewModel homeViewModel;

  //Sizes
  double get homePadding => MediaQuery.of(context).size.width * 0.05;
  double get homeButtonSize => MediaQuery.of(context).size.width * 0.08;
  double get navBarRadius => MediaQuery.of(context).size.width * 0.1;
  double get titleSize => MediaQuery.of(context).size.width * 0.1;
  double get subTitleSize => MediaQuery.of(context).size.width * 0.04;
  double get discountCardWidth => MediaQuery.of(context).size.width * 0.8;
  double get discountCardPadding => MediaQuery.of(context).size.width * 0.01;
  double get discountCardMargin => MediaQuery.of(context).size.width * 0.03;
  double get discountCardRadius => MediaQuery.of(context).size.width * 0.03;

  //Colors
  Color get appBarIconColor => Colors.lightBlue[900];
  Color get navBarColor => Colors.white;
  Color get navUnSelectedColor => Colors.grey[400];
  Color get navSelectedColor => Colors.blue[700];
  Color get titleColor => Colors.blue[700];
  Color get subTitleColor => Colors.grey[400];

  //Texts

  String get homeTitleText => "Choose the laundry service which you want";
  String get subTitleText => "Welcome to, The WashWorld";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: Padding(
          padding: EdgeInsets.all(homePadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(flex: 20, child: homeTitle()),
            Expanded(flex: 5, child: homeSubTitle()),
            Expanded(flex: 35, child: discountCard()),
            Expanded(flex: 40, child: discountCard())
          ])),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(homePadding), child: navigationBar(context)),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      bottomOpacity: 0,
      elevation: 0,
      leading: homeAppBarLeftIcon(context),
      actions: <Widget>[homeAppBarRightIcon(context)],
    );
  }

  IconButton homeAppBarLeftIcon(BuildContext context) {
    return IconButton(
      icon: new Icon(
        Icons.bubble_chart,
        color: appBarIconColor,
        size: homeButtonSize,
      ),
      onPressed: () => Navigator.of(context).pop(null),
    );
  }

  IconButton homeAppBarRightIcon(BuildContext context) {
    return IconButton(
      icon:
          new Icon(Icons.search, color: appBarIconColor, size: homeButtonSize),
      onPressed: () => Navigator.of(context).pop(null),
    );
  }

  Text homeTitle() {
    return Text(subTitleText,
        style: TextStyle(color: titleColor, fontSize: titleSize));
  }

  Text homeSubTitle() {
    return Text(homeTitleText,
        style: TextStyle(color: subTitleColor, fontSize: subTitleSize));
  }

  Center discountCard() {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(discountCardRadius)),
        margin: EdgeInsets.symmetric(
            vertical: discountCardMargin, horizontal: discountCardMargin),
        child: Padding(
          padding: EdgeInsets.all(discountCardPadding),
          child: Container(width: discountCardWidth),
        ),
      ),
    );
  }

  //Global widget olarak düzenlenicek
  Theme navigationBar(BuildContext context) {
    int index = 0;
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: navBarColor),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(navBarRadius),
          child: BottomNavigationBar(
            currentIndex: index,
            onTap: (int _index) {
              setState(() {
                index = _index;
              });
              print(index);
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: index == 0 ? navSelectedColor : navUnSelectedColor,
                    size: homeButtonSize,
                  ),
                  title: zeroHeightSizedBox),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.comment,
                    color: index == 1 ? navSelectedColor : navUnSelectedColor,
                    size: homeButtonSize,
                  ),
                  title: zeroHeightSizedBox),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.payment,
                    color: index == 2 ? navSelectedColor : navUnSelectedColor,
                    size: homeButtonSize,
                  ),
                  title: zeroHeightSizedBox),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: index == 3 ? navSelectedColor : navUnSelectedColor,
                    size: homeButtonSize,
                  ),
                  title: zeroHeightSizedBox),
            ],
          ),
        ));
  }

  get zeroHeightSizedBox => SizedBox(height: 0);
}
