import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../config.dart';

class ThemeSwitcher extends StatelessWidget {
  final Color? activeIconColor;
  final Color? inActiveIconColor;
  final Color? iconColor;
  final Color? toggleColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final bool? status2;
  final ValueChanged<bool>? onToggle;

  const ThemeSwitcher(
      {Key? key,
      this.toggleColor,
      this.activeColor,
      this.inactiveColor,
      this.onToggle,
      this.activeIconColor,
      this.iconColor,
      this.inActiveIconColor,
      this.status2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: AppScreenUtil().screenWidth(70),
      height: AppScreenUtil().screenHeight(25),
      toggleSize: 24.0,
      value: status2!,
      borderRadius: 30.0,
      padding: 1.0,
      activeColor: Colors.black,
      inactiveColor: inactiveColor!,
      switchBorder: Border.all(
        color: toggleColor!,
        width: 2.0,
      ),
      onToggle: onToggle!,
      activeIcon: Icon(
        Icons.nightlight_round,
        color: activeIconColor,
        size: AppScreenUtil().size(30),
      ),
      inactiveIcon: Icon(
        Icons.circle,
        color: inActiveIconColor,
        size: AppScreenUtil().size(30),
      ),
    );
  }
}
