import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'display/header.dart';
import 'display/title.dart';
import 'package:emirates_app/constants.dart';
import 'package:emirates_app/add_flight_screen.dart';
import 'package:emirates_app/display/flight.dart';

@framyWidget
class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  final Header header;
  HomePage({Key key, @required this.header}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation _profilePictureAnimation;
  Animation _contentAnimation;
  Animation _listAnimation;
  Animation _fabAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _profilePictureAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.20, curve: Curves.easeOut)));

    _contentAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.20, 0.40, curve: Curves.easeOut)));

    _listAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.40, 0.75, curve: Curves.easeOut)));

    _fabAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.75, 1.0, curve: Curves.easeOut)));

    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Transform.scale(
                    scale: _profilePictureAnimation.value,
                    child: widget.header),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Transform.scale(
                    scale: _contentAnimation.value,
                    child: HeadTitle(title: 'My flights')),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                _buildSheet(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Transform.scale(
        scale: _fabAnimation.value,
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 35.0,
            color: kMainColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AddFlightScreen.id);
          },
          tooltip: 'Add new tasks',
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
          ),
          backgroundColor: kFloatingButton,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  Widget _buildSheet() {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32),
          ),
        ),
        child: Opacity(opacity: _listAnimation.value, child: Flight()),
      ),
    );
  }
}
