import 'package:flutter/material.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/responsive.dart';

class MyCircularProgressWidget extends StatelessWidget {
  final double minimumSize = 40.0; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceWidth,
      height: context.deviceHeight*.5,
      color: colorLightWhite,

      child: Center(
        child: CircularProgressIndicator(
        
          valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          strokeWidth: 3.0,
        ),
      ),
    );
  }
}