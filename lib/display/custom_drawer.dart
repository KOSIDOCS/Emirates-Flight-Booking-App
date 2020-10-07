import 'package:flutter/material.dart';
import 'package:emirates_app/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomDrawer extends StatefulWidget {
  final Widget child;

  const CustomDrawer({Key key, @required this.child}) : super(key: key);

  static CustomDrawerState of(BuildContext context) =>
      context.findAncestorStateOfType<CustomDrawerState>();

  @override
  CustomDrawerState createState() => new CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  static const Duration toggleDuration = Duration(milliseconds: 250);
  static const double maxSlide = 225;
  static const double minDragStartEdge = 60;
  static const double maxDragStartEdge = maxSlide - 16;
  AnimationController _animationController;
  bool _canBeDragged = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: CustomDrawerState.toggleDuration,
    );
  }

  void close() => _animationController.reverse();

  void open() => _animationController.forward();

  void toggleDrawer() => _animationController.isCompleted ? close() : open();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_animationController.isCompleted) {
          close();
          return false;
        }
        return true;
      },
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: AnimatedBuilder(
          animation: _animationController,
          child: widget.child,
          builder: (context, child) {
            double animValue = _animationController.value;
            final slideAmount = maxSlide * animValue;
            final contentScale = 1.0 - (0.3 * animValue);
            return Stack(
              children: <Widget>[
                MyDrawer(),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(slideAmount)
                    ..scale(contentScale, contentScale),
                  alignment: Alignment.centerLeft,
                  origin: Offset(MediaQuery.of(context).size.width * 0.6, 1),
                  child: GestureDetector(
                    onTap: _animationController.isCompleted ? close : null,
                    child: child,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    //I have no idea what it means, copied from Drawer
    double _kMinFlingVelocity = 365.0;

    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      close();
    } else {
      open();
    }
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kMainColor,
      child: SafeArea(
        child: Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: Padding(
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 30.0, bottom: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => CustomDrawer.of(context).close(),
                  color: Colors.white,
                  iconSize: 30.0,
                ),
                _greetings(greetingType: 'Hello', name: 'Mariam Serio'),
                _drawerTabs(icon: Feather.home, tabName: 'Home'),
                _drawerTabs(icon: Ionicons.md_person, tabName: 'Profile'),
                _drawerTabs(icon: Entypo.wallet, tabName: 'Balance'),
                _drawerTabs(icon: Ionicons.md_basket, tabName: 'Tickets'),
                _drawerTabs(icon: Ionicons.md_heart, tabName: 'Favorites'),
                _drawerTabs(icon: Ionicons.md_help_circle, tabName: 'Help'),
                _drawerTabs(icon: Ionicons.md_settings, tabName: 'Settings'),
                Container(
                  margin: EdgeInsets.only(
                      left: 16.0,
                      top: MediaQuery.of(context).size.height * 0.02),
                  height: 1.0,
                  width: 250.0,
                  color: kTextColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 16.0),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawerTabs({@required IconData icon, @required String tabName}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        onPressed: () {},
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: kFloatingButton,
            ),
            SizedBox(width: 8.0),
            Text(
              tabName,
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _greetings({@required String greetingType, @required String name}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 10.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            '$greetingType,\n$name',
            style: TextStyle(
              fontFamily: 'Gilroy',
              color: Colors.white,
              fontSize: 18.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
