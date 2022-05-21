import 'package:flutter/cupertino.dart';
import '../common/app_screen_util.dart';

class Space extends StatelessWidget {
  final double? width;
  final double? height;

  const Space(this.width, this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
      width: AppScreenUtil().screenWidth(width!),
      height: AppScreenUtil().screenHeight(height!));
}

// Vertical Space
class VSpace extends StatelessWidget {
  final double size;

  const VSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(0, AppScreenUtil().size(size));
}

//Horizontal Space
class HSpace extends StatelessWidget {
  final double size;

  const HSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(AppScreenUtil().size(size), 0);
}
