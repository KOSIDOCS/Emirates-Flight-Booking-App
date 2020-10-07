import 'package:flutter/material.dart';
import 'package:emirates_app/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:emirates_app/display/plane_curve.dart';
import 'package:emirates_app/display/detail.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_line/dotted_line.dart';
// import 'package:barcode_flutter/barcode_flutter.dart';

class DetailScreen extends StatefulWidget {
  static const String id = 'detail_screen';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.001),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0.0, right: 0.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Row(
                        children: <Widget>[
                          backbutton(),
                          Spacer(),
                          profileimg(),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Padding(
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      child: pickedflight(),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.034),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: ClipPath(
                        clipper: DetailClipper(radius: 10.0),
                        child: Material(
                          elevation: 4.0,
                          shadowColor: Color(0x30E5E5E5),
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: ClipPath(
                            clipper: DetailClipper(radius: 12.0),
                            child: Card(
                              elevation: 2.0,
                              margin: EdgeInsets.all(2.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: _buildCardContent(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget backbutton() {
    return IconButton(
      icon: Icon(AntDesign.arrowleft),
      onPressed: () => Navigator.pop(context),
      color: Colors.white,
      iconSize: 30.0,
    );
  }

  Widget profileimg() {
    return Card(
      //color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(13.0),
          bottomRight: Radius.circular(12.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset(
          'assets/Woman.jpeg',
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.14,
          fit: BoxFit.cover,
          //color: Color(0xFF0C382E),
          filterQuality: FilterQuality.medium,
          colorBlendMode: BlendMode.color,
        ),
      ),
    );
  }

  Widget pickedflight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'DBC',
                style: TextStyle(
                  fontFamily: 'Sofia Pro',
                  color: kFloatingButton,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Dabaca',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Sofia Pro',
                  fontSize: 10.0,
                  letterSpacing: 0.1,
                  fontWeight: FontWeight.w300,
                  height: 2.0,
                ),
              ),
            ],
          ),
        ),
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
              '1hr 35m',
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
                height: 1.5,
              ),
            ),
          ],
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'ADY',
                style: TextStyle(
                  fontFamily: 'Sofia Pro',
                  color: kFloatingButton,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Almedy',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Sofia Pro',
                  fontSize: 10.0,
                  letterSpacing: 0.1,
                  fontWeight: FontWeight.w300,
                  height: 2.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _buildCardContent() {
    final Widget svgEmiratesImage = SvgPicture.asset(
      'assets/emirates-airlines-2.svg',
      height: 60.0,
    );
    final Widget map = SvgPicture.asset(
      'assets/map.svg',
      height: 158.0,
    );
    final Widget code = SvgPicture.asset(
      'assets/CODE.svg',
      height: 70.0,
    );
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 1.0, left: 7.0, bottom: 5.0),
                    child: svgEmiratesImage,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7.0, bottom: 5.0),
                    child: Icon(Entypo.aircraft_take_off,
                        size: 23.0, color: kFloatingButton),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                      child: Text('Ticket Price', style: kTextStyle)),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
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
                                  color: kMainColor,
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
                              color: kMainColor,
                              fontSize: 23.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 0.0),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: map,
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 29.0, right: 45.0, bottom: 5.0),
            child: Divider(
              color: kTextColor,
              thickness: 0.3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Table(
                  border: TableBorder.all(
                    color: kMainColor,
                    width: 1,
                    style: BorderStyle.none,
                  ),
                  children: [
                    TableRow(children: [
                      TableCell(
                          child: Center(
                              child: Text(
                        'FLIGHT DATE',
                        style: kTextStyle,
                      ))),
                      TableCell(
                        child: Center(
                            child: Text(
                          'GATE',
                          style: kTextStyle,
                        )),
                      ),
                      TableCell(
                          child: Center(
                              child: Text(
                        'FLIGHT NO',
                        style: kTextStyle,
                      ))),
                    ]),
                    TableRow(children: [
                      TableCell(
                          child: Align(
                              alignment: Alignment(-0.3, 0),
                              child: Text(
                                'May 19',
                                style: kTableBold,
                              ))),
                      TableCell(
                        child: Align(
                            alignment: Alignment(-0.1, 0),
                            child: Text(
                              'B2',
                              style: kTableBold,
                            )),
                      ),
                      TableCell(
                        child: Align(
                            alignment: Alignment(-0.3, 0),
                            child: Text(
                              'KB76',
                              style: kTableBold,
                            )),
                      ),
                    ]),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Table(
                  border: TableBorder.all(
                    color: kMainColor,
                    width: 1,
                    style: BorderStyle.none,
                  ),
                  children: [
                    TableRow(children: [
                      TableCell(
                          child: Align(
                        alignment: Alignment(0.5, 0),
                        child: Text(
                          'BOARDING TIME',
                          style: kTextStyle,
                        ),
                      )),
                      TableCell(
                        child: Align(
                          alignment: Alignment(-0.1, 0),
                          child: Text(
                            'SEAT',
                            style: kTextStyle,
                          ),
                        ),
                      ),
                      TableCell(
                          child: Align(
                        alignment: Alignment(-0.3, 0),
                        child: Text(
                          'CLASS',
                          style: kTextStyle,
                        ),
                      )),
                    ]),
                    TableRow(children: [
                      TableCell(
                          child: Align(
                              alignment: Alignment(-0.3, 0),
                              child: Text(
                                '8:35 AM',
                                style: kTableBold,
                              ))),
                      TableCell(
                        child: Align(
                            alignment: Alignment(-0.1, 0),
                            child: Text(
                              '19A',
                              style: kTableBold,
                            )),
                      ),
                      TableCell(
                        child: Align(
                            alignment: Alignment(-0.0, 0),
                            child: Text(
                              'Economy',
                              style: kTableBold,
                            )),
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          DottedLine(
            dashColor: kMainColor,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text('Boarding pass', style: kTableBold),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          code,
        ],
      ),
    );
  }
}
