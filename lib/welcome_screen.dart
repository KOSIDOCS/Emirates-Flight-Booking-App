import 'package:flutter/material.dart';
import 'package:emirates_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:emirates_app/home_page.dart';
import 'package:framy_annotation/framy_annotation.dart';

@framyWidget
class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation _logoAnimation;
  Animation _inputAnimation;
  Animation _accesAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 8));

    _logoAnimation = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.40, curve: Curves.easeOut)));

    _inputAnimation = Tween(begin: 90.0, end: 75.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.40, 0.60, curve: Curves.easeOut)));

    _accesAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.60, 1.0, curve: Curves.easeOut)));

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

  final Widget svgEmiratesImage =
      SvgPicture.asset('assets/emirates-airlines-1.svg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: MediaQuery.of(context).size.height * 0.12,
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: _logoAnimation.value,
                child: Center(
                  child: svgEmiratesImage,
                ),
              ),
              _customTextfield(
                  labelName: 'E-MAIL',
                  labelIcon: Entypo.email,
                  keybordtype: TextInputType.emailAddress,
                  obscure: false),
              _customTextfield(
                  labelName: 'PASSWORD',
                  labelIcon: SimpleLineIcons.lock,
                  keybordtype: TextInputType.text,
                  obscure: true),
              _accessOptions(),
            ],
          ),
        ),
      ),
    );
  }

  bool typeIn = false;

  Widget _customTextfield(
      {@required String labelName,
      @required IconData labelIcon,
      @required TextInputType keybordtype,
      @required bool obscure}) {
    return Container(
      height: _inputAnimation.value,
      padding: EdgeInsets.only(bottom: 10.0),
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
                  size: 18.0,
                ),
              ),
              SizedBox(width: 6.0),
              Container(
                  width: 0.5,
                  height: 45.0,
                  color: typeIn == true ? kFloatingButton : kTextColor),
              SizedBox(width: 14.0),
              Expanded(
                child: TextFormField(
                  keyboardType: keybordtype,
                  textCapitalization: TextCapitalization.none,
                  obscureText: obscure,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: kFloatingButton,
                  ),
                  onTap: () => typeIn = true,
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
              color: typeIn == true ? kFloatingButton : kTextColor),
        ],
      ),
    );
  }

  Widget _accessOptions() {
    return Container(
      height: _accesAnimation.value,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: kTextColor,
                fontFamily: 'Gilroy',
                fontSize: 13.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w300,
                height: 2.5,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, HomePage.id);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: kFloatingButton,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Center(
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: kMainColor,
                    fontFamily: 'Gilroy',
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Not a member ?',
                style: TextStyle(
                  color: kTextColor,
                  fontFamily: 'Gilroy',
                  fontSize: 13.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(width: 4.0),
              GestureDetector(
                child: Text(
                  'Join now',
                  style: TextStyle(
                    color: kFloatingButton,
                    fontFamily: 'Gilroy',
                    fontSize: 13.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
