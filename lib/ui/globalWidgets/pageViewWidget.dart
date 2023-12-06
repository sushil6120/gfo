import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hisab_brabar/utils/responsive.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/valueConstants.dart';

class PageViewWidget extends StatelessWidget {
  String? img;
  double? imgHeight;
  double? imgWidth;
  String? headingText;
  String? subHeadingText;
  double? v1Bottom;
  double? v1top;
  double? v1Left;
  double? v1Right;
  double? v2Right;
  double? v2Bottom;
  double? v2Left;
  double? v2top;
  double? angle;
  bool? angle2;

  PageViewWidget(
      {this.img,
      this.imgHeight,
      this.imgWidth,
      this.headingText,
      this.subHeadingText,
      this.angle,
      this.angle2,
      this.v1Bottom,
      this.v1Left,
      this.v1Right,
      this.v1top,
      this.v2Bottom,
      this.v2Left,
      this.v2Right,
      this.v2top});

  @override
  Widget build(BuildContext context) {
    return Column(
    
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: [
            Container(
              height: context.actualHeight * .58,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(img!)),
                  color: Theme.of(context).scaffoldBackgroundColor),
            ),
            Positioned(
                bottom: v1Bottom,
                right: v1Right,
                top: v1top,
                left: v1Left,
                child: Transform.flip(
                  flipY:angle2! ,
                  child: SvgPicture.asset("assets/images/Vector 1.svg"))),
            Positioned(
                bottom: v2Bottom,
                right: v2Right,
                left: v2Left,
                top: v2top,
                child: Transform.rotate(
                    angle: angle!,
                    child: SvgPicture.asset("assets/images/Vector 4.svg"))),
          ],
        ),
        const SizedBox(height: verticalSpaceMedium),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(headingText!,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 22, color: primaryColor)),
        ),
        SizedBox(height: verticalSpaceSmall2,),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(subHeadingText!,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 14,color: colorDark2)),
        ),
      ],
    );
  }
}
