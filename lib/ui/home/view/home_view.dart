import 'package:flutter/material.dart';
import 'package:flutter_wash_app/core/base/model/error_model.dart';
import 'package:flutter_wash_app/ui/home/model/discountlist_model.dart';
import 'package:flutter_wash_app/ui/home/viewmodel/home_viewmodel.dart';

class HomeView extends HomeViewModel {
  //------Sizes-----//

  double get homePadding => MediaQuery.of(context).size.width * 0.05;
  double get homeButtonSize => MediaQuery.of(context).size.width * 0.08;

  //NavBar
  double get navBarRadius => MediaQuery.of(context).size.width * 0.1;
  double get navBarPadding => MediaQuery.of(context).size.width * 0.05;

  //Title
  double get titleSize => MediaQuery.of(context).size.width * 0.1;
  double get subTitleSize => MediaQuery.of(context).size.width * 0.04;

  //DiscountCard
  double get discountCardWidth => MediaQuery.of(context).size.width * 0.8;
  double get discountCardHeight => MediaQuery.of(context).size.width * 0.3;
  double get discountCardPadding => MediaQuery.of(context).size.width * 0.01;
  double get discountCardMargin => MediaQuery.of(context).size.width * 0.03;
  double get discountCardRadius => MediaQuery.of(context).size.width * 0.03;

  //HomeCard
  double get homeCardWidth => MediaQuery.of(context).size.width * 0.4;
  double get homeCardHeight => MediaQuery.of(context).size.width * 0.4;
  double get homeCardRadius => MediaQuery.of(context).size.width * 0.04;
  double get homeCardiconSize => 60;

  //------Colors-----//
  Color get appBarIconColor => Colors.lightBlue[900];
  Color get navBarColor => Colors.white;
  Color get navUnSelectedColor => Colors.grey[400];
  Color get navSelectedColor => Colors.blue[700];
  Color get titleColor => Colors.blue[700];
  Color get subTitleColor => Colors.grey[400];

  //Texts
  String get homeTitleText => "Choose the laundry service which you want";
  String get subTitleText => "Welcome to, The WashWorld";

  //SizedBoxes
  get zeroHeightSizedBox => SizedBox(height: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: homeBody(),
      bottomNavigationBar: navigationBar(context),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
        leading: homeAppBarLeftIcon(context),
        actions: [homeAppBarRightIcon(context)]);
  }

  IconButton homeAppBarLeftIcon(BuildContext context) {
    return IconButton(
        icon: new Icon(Icons.bubble_chart,
            color: appBarIconColor, size: homeButtonSize),
        onPressed: () => Navigator.of(context).pop(null));
  }

  IconButton homeAppBarRightIcon(BuildContext context) {
    return IconButton(
        icon: new Icon(Icons.search,
            color: appBarIconColor, size: homeButtonSize),
        onPressed: () => Navigator.of(context).pop(null));
  }

  Padding homeBody() {
    return Padding(
        padding: EdgeInsets.all(homePadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(flex: 20, child: homeTitle()),
          Expanded(flex: 5, child: homeSubTitle()),
          Expanded(flex: 35, child: disCountFutureBuilder()),
          Expanded(flex: 40, child: homeCardList())
        ]));
  }

  Text homeTitle() {
    return Text(subTitleText,
        style: TextStyle(color: titleColor, fontSize: titleSize));
  }

  Text homeSubTitle() {
    return Text(homeTitleText,
        style: TextStyle(color: subTitleColor, fontSize: subTitleSize));
  }

  FutureBuilder<List<DiscountListModel>> disCountFutureBuilder() {
    return FutureBuilder<List<DiscountListModel>>(
      future: homeService.getDiscountList(),
      builder: (BuildContext context,
          AsyncSnapshot<List<DiscountListModel>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasData) {
              return disCountListView(snapshot.data);
            } else {
              final error = snapshot.error as ErrorModel;
              return Center(
                child: Text(error.text),
              );
            }
            break;
          default:
            return Text("Something went wrong");
        }
      },
    );
  }

  ListView disCountListView(List<DiscountListModel> discounts) {
    return ListView.builder(
      itemCount: discounts.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => discountCard(discounts[index]),
    );
  }

  Center discountCard(DiscountListModel discount) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(discountCardRadius)),
        margin: EdgeInsets.symmetric(
            vertical: discountCardMargin, horizontal: discountCardMargin),
        child: Container(
          width: discountCardWidth,
          height: discountCardHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(discountCardRadius),
            child: Image.network(
              discount.imgurl,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Column homeCardList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            homeCard(homeCardIcon(Icons.ac_unit), "Washing"),
            homeCard(homeCardIcon(Icons.access_alarm), "Ironing")
          ],
        ),
        Row(
          children: [],
        )
      ],
    );
  }

  Center homeCard(Icon icon, String title) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(homeCardRadius)),
        child: Container(
          width: homeCardWidth,
          height: homeCardHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(10), child: icon),
              Text(title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }

  Icon homeCardIcon(IconData icon) {
    return Icon(
      icon,
      size: homeCardiconSize,
    );
  }

  //Global widget olarak düzenlenicek
  Padding navigationBar(BuildContext context) {
    int index = 0;
    return Padding(
      padding: EdgeInsets.only(
          left: navBarPadding, right: navBarPadding, bottom: navBarPadding),
      child: Theme(
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
        ),
      ),
    );
  }
}
