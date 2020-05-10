import 'package:flutter/material.dart';
import 'package:traveller/models/location.dart';
import 'package:traveller/models/mock.dart';
import 'package:traveller/models/user.dart';
import 'package:traveller/styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double bannerHeight = height * 0.35;

    return Stack(
      children: <Widget>[
        Container(
          height: bannerHeight,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [kPrimaryColor, Colors.pink],
          )),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildTopSection(bannerHeight),
                _buildTitleSection("Right now at Yosemite"),
                SizedBox(
                  height: 15,
                ),
                _buildPointsOfInterest(),
                SizedBox(
                  height: 10,
                ),
                _buildTitleSection("Popular Travelers"),
                SizedBox(
                  height: 10,
                ),
                _buildPopularTravelers(),
              ],
            ),
          ),
        )
      ],
    );
  }

  _buildTopSection(double bannerHeight) {
    MediaQueryData data = MediaQuery.of(context);
    double edgePadding = 20;

    return Container(
      height: bannerHeight - data.padding.top + edgePadding * 2 + 20,
      padding: EdgeInsets.all(edgePadding),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.menu,
                color: Colors.white,
              ),
              Spacer(),
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile0.jpg"),
              )
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            "Travelers",
            style: kTitleTextStyle,
          ),
          Text(
            "App connect with travel community",
            textAlign: TextAlign.center,
            style: kSubtitleTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(color: kPrimaryColor, width: 2),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  child: Icon(Icons.search),
                  padding: EdgeInsets.all(20),
                ),
                Container(
                  width: 1,
                  height: 50,
                  color: kPrimaryColor,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Search your destination",
                          style: kBoxSearchTextStyle,
                        ),
                        TextField(
                          cursorColor: kPrimaryColor,
                          decoration:
                              kDefaultInput.copyWith(hintText: "E.g. Tahoe"),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildTitleSection(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: kSectionTitleTextStyle,
          ),
          Spacer(),
          Text(
            "See all",
            style: kMoreDetailsTextStyle,
          )
        ],
      ),
    );
  }

  _buildPointsOfInterest() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            ...locations
                .map((location) => PointOfInterest(
                      location: location,
                    ))
                .toList()
          ],
        ),
      ),
    );
  }

  _buildPopularTravelers() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(width: 20,),
          ...users
              .map((user) => Traveler(
                    user: user,
                  ))
              .toList()
        ],
      ),
    );
  }
}

class Traveler extends StatelessWidget {
  User user;

  Traveler({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.fromLTRB(2, 5, 10, 10),
      padding: EdgeInsets.all(5),
      decoration: kCardDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(user.image),
          ),
          Text(
            user.name,
            textAlign: TextAlign.center,
            style: kSmallCardTextStyle,
          )
        ],
      ),
    );
  }
}

class PointOfInterest extends StatelessWidget {
  Location location;

  PointOfInterest({this.location});

  @override
  Widget build(BuildContext context) {
    double cardWidth = 150;

    List<SmallProfileAvatar> profiles = [];
    location.users.asMap().forEach((index, user) {
      profiles.add(SmallProfileAvatar(
        left: (10 + index * 25).toDouble(),
        user: user,
      ));
    });

    return Container(
      margin: EdgeInsets.fromLTRB(2, 5, 10, 10),
      height: 180,
      width: cardWidth,
      decoration: kCardDecoration,
      child: Column(
        children: <Widget>[
          Container(
            width: cardWidth,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                location.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            location.name,
            style: kSmallCardTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                ...profiles,
                // Black Plus button
                Positioned(
                  left: (10 + location.users.length * 25).toDouble(),
                  child: Container(
                    width: 45,
                    height: 45,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.black,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SmallProfileAvatar extends StatelessWidget {
  double left;
  User user;

  SmallProfileAvatar({this.left, this.user});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(user.image),
        ),
      ),
    );
  }
}
