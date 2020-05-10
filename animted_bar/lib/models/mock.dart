import 'package:traveller/models/location.dart';
import 'package:traveller/models/user.dart';

var users = [
  User(
    name: "Jenny Smith",
    image: "assets/images/profile0.jpg",
    from: "England",
  ),
  User(
    name: "Aisling Brown",
    image: "assets/images/profile1.jpg",
    from: "England",
  ),
  User(
    name: "Alex Martinez",
    image: "assets/images/profile2.jpg",
    from: "Canada",
  ),
  User(
    name: "Tim Anderson",
    image: "assets/images/profile3.jpg",
    from: "England",
  ),
  User(
    name: "Mary Sullivan",
    image: "assets/images/profile4.jpg",
    from: "England",
  ),
  User(
    name: "Sarah Johnson",
    image: "assets/images/profile5.jpg",
    from: "England",
  ),
  User(
    name: "John Dorsey",
    image: "assets/images/profile6.jpg",
    from: "England",
  ),
  User(
    name: "Kelly Horowitz",
    image: "assets/images/profile7.jpg",
    from: "England",
  ),
  User(
    name: "Anna Miller",
    image: "assets/images/profile8.jpg",
    from: "England",
  ),
  User(
    name: "George Lopez",
    image: "assets/images/profile9.jpg",
    from: "England",
  ),
  User(
    name: "Jennifer Garcia",
    image: "assets/images/profile10.jpg",
    from: "England",
  ),
  User(
    name: "Terrence Chavez",
    image: "assets/images/profile11.jpg",
    from: "England",
  ),
  User(
    name: "Maderine Olson",
    image: "assets/images/profile12.jpg",
    from: "England",
  ),
];

var locations = [
  Location(
      name: "The Tunnel",
      image: "assets/images/landscape0.jpg",
      users: [users[0], users[1], users[2]]),
  Location(
      name: "Half Dome",
      image: "assets/images/landscape1.jpg",
      users: [users[3], users[4]]),
  Location(
      name: "Glacier Point",
      image: "assets/images/landscape2.jpg",
      users: [users[5], users[6]]),
];