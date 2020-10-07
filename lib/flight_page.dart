import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:emirates_app/constants.dart';

class FlightPage extends StatefulWidget {
  @override
  _FlightPageState createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        for (Flight flight in availableFlight) flightDays(flight)
      ],
    );
  }
}

Widget flightDays(Flight flight) {
  return Container(
    height: 20.0,
    width: 20.0,
    padding: EdgeInsets.symmetric(horizontal: 32),
    decoration: BoxDecoration(
      color: kMainColor,
      border: Border.all(
        width: 1,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),
      ),
    ),
    child: Column(
      children: [
        Text(flight.day, style: kTextStyle),
        Text(flight.dayNum, style: kTextStyle),
      ],
    ),
  );
}

final List<Flight> availableFlight = [
  Flight(day: 'TUE', dayNum: '13'),
  Flight(day: 'WED', dayNum: '14'),
  Flight(day: 'THU', dayNum: '15'),
  Flight(day: 'FRI', dayNum: '16'),
  Flight(day: 'SAT', dayNum: '17'),
  Flight(day: 'SUN', dayNum: '18'),
  Flight(day: 'MON', dayNum: '19'),
];

class Flight {
  final String day;
  final String dayNum;
  Flight({@required this.day, @required this.dayNum});
}
