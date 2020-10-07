import 'package:flutter/material.dart';
import 'package:emirates_app/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Padding(
            padding: const EdgeInsets.only(left: 45.0, right: 10.0),
            child: _buildTrip(),
          ),
          SizedBox(height: 10.0),
          _buildDetails(
              labelName: 'FROM',
              labelIcon: Entypo.aircraft_take_off,
              context: context),
          _buildDetails(
              labelName: 'TO',
              labelIcon: Entypo.aircraft_landing,
              context: context),
          _buildDetails(
              labelName: 'DATE',
              labelIcon: SimpleLineIcons.calendar,
              context: context),
          _buildDetails(
              labelName: 'TRAVELER',
              labelIcon: Ionicons.md_people,
              context: context),
          _buildDetails(
              labelName: 'CLASS',
              labelIcon: Icons.accessible,
              context: context),
        ],
      ),
    );
  }

  Widget _buildDetails(
      {@required String labelName,
      @required IconData labelIcon,
      BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(left: 45.0, right: 45.0),
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 7.0, top: 4.0, bottom: 14.0),
                  child: Icon(
                    labelIcon,
                    color: kFloatingButton,
                    size: 23.0,
                  ),
                ),
                SizedBox(width: 6.0),
                Container(width: 0.5, height: 39.0, color: kTextColor),
                SizedBox(width: 14.0),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    cursorColor: kTextColor,
                    decoration: InputDecoration(
                      focusedBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                      focusColor: kTextColor,
                      labelText: labelName,
                      labelStyle: TextStyle(
                        color: kTextColor,
                        fontFamily: 'Gilroy',
                        fontSize: 12.0,
                        letterSpacing: 0.1,
                        fontWeight: FontWeight.w300,
                      ),
                      enabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width * 2.1,
                height: 0.5,
                color: kTextColor),
          ],
        ),
      ),
    );
  }

  bool isClicked = true;

  Widget _buildTrip() {
    return Container(
      // padding: EdgeInsets.only(bottom: 0.3),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 15.0, top: 4.0, bottom: 14.0),
                child: Text(
                  'One Way',
                  style: isClicked ? kTripTextSelected : kTripText,
                ),
              ),
              SizedBox(width: 6.0),
              Container(width: 0.5, height: 40.0, color: kTextColor),
              SizedBox(width: 14.0),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 4.0, bottom: 14.0),
                child: Text(
                  'Roundtrip',
                  style: kTripText,
                ),
              ),
              SizedBox(width: 6.0),
              Container(width: 0.5, height: 40.0, color: kTextColor),
              SizedBox(width: 6.0),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 14.0, top: 4.0, bottom: 14.0),
                child: Text(
                  'Multiple',
                  style: kTripText,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
                width: MediaQuery.of(context).size.width * 2.1,
                height: 0.5,
                color: kTextColor),
          ),
        ],
      ),
    );
  }
}
