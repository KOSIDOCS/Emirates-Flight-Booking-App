import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'display/plane_curve.dart';
import 'package:emirates_app/constants.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  // bool pressbutton = false;

  // onButtonClick() {
  //   setState(() {
  //     pressbutton = !pressbutton;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 50.0, right: 50.0, top: 30.0, bottom: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'DBC',
                          style: kCountryAbText,
                        ),
                        Text(
                          'Dabaca',
                          style: kCountryName,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07),
                        Text(
                          'FLIGHT DATE',
                          style: kFlightDate,
                        ),
                        Text(
                          'May 19',
                          style: kFlightDateDisplay,
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(width: 6.0),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      CustomPaint(
                        painter:
                            PlaneCurved(bodyColor: kFloatingButton, width: 0.2),
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
                        '1hr 35m',
                        style: kFlightDateDisplay,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07),
                      Text(
                        'Gate',
                        style: kFlightDate,
                      ),
                      Text(
                        'B2',
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
                          'ADY',
                          style: kCountryAbText,
                        ),
                        Text(
                          'Almedy',
                          style: kCountryName,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07),
                        Text(
                          'FLIGHT NO',
                          style: kFlightDate,
                        ),
                        Text(
                          'KB76',
                          style: kFlightDateDisplay,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FLIGHT DATE',
                        style: kFlightDate,
                      ),
                      Text(
                        'May 19',
                        style: kFlightDateDisplay,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SEAT',
                        style: kFlightDate,
                      ),
                      Text(
                        '19A',
                        style: kFlightDateDisplay,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CLASS',
                        style: kFlightDate,
                      ),
                      Text(
                        'Economy',
                        style: kFlightDateDisplay,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Divider(
                thickness: 0.3,
                color: kTextColor,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.55,
                    top: MediaQuery.of(context).size.height * 0.02),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Transform.translate(
                          offset: Offset(5, -4),
                          child: Text(
                            '\$',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: kFloatingButton,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '\t170.00',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: kFloatingButton,
                          fontSize: 23.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment via',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0, right: 10.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  buildPay(name: 'IPay', click: true),
                  Container(width: 0.5, height: 40.0, color: kTextColor),
                  buildPay(name: 'PayPal', click: false),
                  Container(width: 0.5, height: 40.0, color: kTextColor),
                  buildPay(name: 'Wallet', click: false),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Container(
                    width: MediaQuery.of(context).size.width * 2.1,
                    height: 0.5,
                    color: kTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPay({String name, bool click}) {
    return FlatButton.icon(
      icon: Icon(
        Ionicons.ios_checkmark,
        color: click ? kFloatingButton : Colors.white,
      ),
      label: Text(name, style: click ? kScrollTabClicked : kFlightDateDisplay),
      onPressed: () {},
    );
  }
}
