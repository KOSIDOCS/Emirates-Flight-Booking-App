import 'package:flutter/widgets.dart';
import 'package:emirates_app/constants.dart';
import 'package:emirates_app/display/custom_drawer.dart';

class MenuIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: menu(context),
        onTap: () => CustomDrawer.of(context).open(),
      ),
    );
  }

  Widget menu(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.004,
              width: MediaQuery.of(context).size.width * 0.04,
              color: kMainColor),
        ),
        SizedBox(height: 6.0),
        Container(
          height: MediaQuery.of(context).size.height * 0.004,
          width: MediaQuery.of(context).size.width * 0.08,
          color: kMainColor,
        ),
        SizedBox(height: 6.0),
        Container(
          height: MediaQuery.of(context).size.height * 0.004,
          width: MediaQuery.of(context).size.width * 0.04,
          color: kMainColor,
        ),
      ],
    );
  }
}

// Use material keybord Arrow up.
