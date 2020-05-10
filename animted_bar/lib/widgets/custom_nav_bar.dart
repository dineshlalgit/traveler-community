import 'package:flutter/material.dart';
import 'package:traveller/styles.dart';

enum BottomBar {
  HOME,
  EVENTS,
  MESSAGES,
}

class CustomNavBar extends StatelessWidget {
  Function onTabClicked;
  BottomBar currentTab;

  CustomNavBar({this.onTabClicked, this.currentTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomNavBarItem(
            type: BottomBar.HOME,
            isActive: currentTab == BottomBar.HOME,
            onTabClicked: onTabClicked,
          ),
          CustomNavBarItem(
            type: BottomBar.EVENTS,
            isActive: currentTab == BottomBar.EVENTS,
            onTabClicked: onTabClicked,
          ),
          CustomNavBarItem(
            type: BottomBar.MESSAGES,
            isActive: currentTab == BottomBar.MESSAGES,
            onTabClicked: onTabClicked,
          ),
        ],
      ),
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  BottomBar type;
  bool isActive;
  Function onTabClicked;

  CustomNavBarItem({this.type, this.isActive, this.onTabClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTabClicked(type);
      },
      child: AnimatedContainer(
        width: isActive ? 150 : 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isActive ? kPrimaryColor : Colors.transparent,
        ),
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  getIcon(),
                  color: isActive ? Colors.white : Colors.grey,
                ),
                SizedBox(
                  width: 8,
                ),
                Visibility(
                  visible: isActive,
                  child: Text(
                    getTitle(),
                    style: kSectionTitleTextStyle.copyWith(
                      color: isActive ? Colors.white : Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData getIcon() {
    switch (type) {
      case BottomBar.HOME:
        return Icons.home;
      case BottomBar.EVENTS:
        return Icons.calendar_today;
      case BottomBar.MESSAGES:
        return Icons.question_answer;
    }
  }

  String getTitle() {
    switch (type) {
      case BottomBar.HOME:
        return "Home";
      case BottomBar.EVENTS:
        return "Events";
      case BottomBar.MESSAGES:
        return "Messages";
    }
  }
}
