import 'package:flutter/material.dart';
import 'package:emirates_app/display/plane_curve.dart';
import 'package:emirates_app/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:emirates_app/detail-screen.dart';

class Flight extends StatefulWidget {
  @override
  _FlightState createState() => _FlightState();
}

class _FlightState extends State<Flight> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 40.0),
      child: Column(
        children: <Widget>[
          for (DisplayFlight displayFlight in flights)
            GestureDetector(
              child: fullFlightList(displayFlight),
              onTap: () {
                Navigator.pushNamed(context, DetailScreen.id);
              },
            ),
        ],
      ),
    );
  }

  // for (DisplayFlight displayFlight in flights)
  //           fullFlightList(displayFlight)

  // Widget _checkLastItem() {
  //   if () {

  //   }
  // }

  Widget fullFlightList(DisplayFlight displayFlight) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    displayFlight.startCountryAb,
                    style: kCountryAbText,
                  ),
                  Text(
                    displayFlight.startCountryName,
                    style: kCountryName,
                  ),
                  SizedBox(height: 28.0),
                  Text(
                    'DATE',
                    style: kFlightDate,
                  ),
                  Text(
                    displayFlight.flightDate,
                    style: kFlightDateDisplay,
                  ),
                ],
              ),
            ),
            // SizedBox(width: 6.0),
            Column(
              children: <Widget>[
                CustomPaint(
                  painter: PlaneCurved(bodyColor: kFloatingButton, width: 0.2),
                  child: Container(
                    //height: 0.0,
                    width: 48.0,
                    child: Icon(
                      Entypo.aircraft_take_off,
                      color: kFloatingButton,
                    ),
                  ),
                ),
                Text(
                  displayFlight.flightTime,
                  style: kFlightDateDisplay,
                ),
              ],
            ),
            //Spacer(),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    displayFlight.destinationAb,
                    style: kCountryAbText,
                  ),
                  Text(
                    displayFlight.destinationName,
                    style: kCountryName,
                  ),
                  SizedBox(height: 28.0),
                  Text(
                    'FLIGHT NO',
                    style: kFlightDate,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      displayFlight.flightNumber,
                      style: kFlightDateDisplay,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Divider(
          color: kFloatingButton,
          thickness: 0.2,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
      ],
    );
  }
}

final List<DisplayFlight> flights = [
  DisplayFlight(
      startCountryAb: 'DBC',
      startCountryName: 'Dabaca',
      destinationAb: 'ADY',
      destinationName: 'Almedy',
      flightDate: 'May 19, 8:35 AM',
      flightTime: '1hr 35m',
      flightNumber: 'KB76'),
  DisplayFlight(
      startCountryAb: 'ADY',
      startCountryName: 'Almedy',
      destinationAb: 'DBC',
      destinationName: 'Dabaca',
      flightDate: 'May 23, 2:15 PM',
      flightTime: '1hr 35m',
      flightNumber: 'BH07'),
  DisplayFlight(
      startCountryAb: 'DBC',
      startCountryName: 'Dabaca',
      destinationAb: 'DNT',
      destinationName: 'Dinat',
      flightDate: 'May 29, 13:00 AM',
      flightTime: '1hr 15m',
      flightNumber: 'AJ06'),
  DisplayFlight(
      startCountryAb: 'DCC',
      startCountryName: 'Dabaca',
      destinationAb: 'DNT',
      destinationName: 'Dinat',
      flightDate: 'May 29, 13:00 AM',
      flightTime: '1hr 15m',
      flightNumber: 'AJ06'),
];

class DisplayFlight {
  final String startCountryAb;
  final String startCountryName;
  final String destinationAb;
  final String destinationName;
  final String flightDate;
  final String flightNumber;
  final String flightTime;

  DisplayFlight(
      {@required this.startCountryAb,
      @required this.startCountryName,
      @required this.destinationAb,
      @required this.destinationName,
      @required this.flightDate,
      @required this.flightTime,
      @required this.flightNumber});
}
