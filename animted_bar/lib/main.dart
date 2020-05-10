import 'package:flutter/material.dart';
import 'package:traveller/screens/home.dart';
import 'package:traveller/styles.dart';
import 'package:traveller/widgets/custom_nav_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BottomBar _currentTab = BottomBar.HOME;

  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traveler App',
      home: Scaffold(
        backgroundColor: kBackgroundColor,
        bottomNavigationBar: CustomNavBar(
          currentTab: _currentTab,

          onTabClicked: (BottomBar tab) {
            setState(() {
              _currentTab = tab;
              _controller.animateToPage(
                  tab.index, duration: Duration(milliseconds: 300),
                  curve: Curves.ease);
            });
          },
        ),
        body: PageView(
          controller: _controller,
          children: <Widget>[
            HomeScreen(),
            Center(child: Text("Events")),
            Center(child: Text("Messages")),
          ],
        ),
      ),
    );
  }
}
