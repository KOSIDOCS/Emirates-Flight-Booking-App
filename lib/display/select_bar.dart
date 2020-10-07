import 'package:flutter/material.dart';
import 'package:emirates_app/constants.dart';

class Tabs extends StatelessWidget {
  final int currentIndex;
  Tabs({this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // SizedBox(height: 24.0),
            MyTab(
              positionIndex: 0,
              currentIndex: currentIndex,
              text: 'Route',
            ),
            MyTab(
              positionIndex: 1,
              currentIndex: currentIndex,
              text: 'Flight',
            ),
            MyTab(
              positionIndex: 2,
              currentIndex: currentIndex,
              text: 'Seat',
            ),
            MyTab(
              positionIndex: 3,
              currentIndex: currentIndex,
              text: 'Checkout',
            ),
          ],
        ),
        Divider(color: kTextColor, thickness: 0.3),
      ],
    );
  }
}

class MyTab extends StatelessWidget {
  final String text;
  final int positionIndex, currentIndex;

  MyTab(
      {Key key,
      @required this.positionIndex,
      @required this.currentIndex,
      @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 16.0,
            color: positionIndex == currentIndex ? kFloatingButton : kTextColor,
            fontWeight: positionIndex == currentIndex
                ? FontWeight.w800
                : FontWeight.w300,
          ),
        ),
        positionIndex == currentIndex
            ? Transform.translate(
                offset: Offset(0.0, 10.0),
                child: Container(
                  height: 4,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: kFloatingButton,
                  ),
                ),
              )
            : Container(
                height: 6,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.transparent,
                ),
              ),
      ],
    );
  }
}
