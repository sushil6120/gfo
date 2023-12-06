import 'package:flutter/material.dart';

import 'circularProgressWidget.dart';

class ButtonBig extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
  final double? height;
  final double? width;
  final bool? showProgress;
  final String? text;
  final Color? backgroundColor;
  final Color? backgroundColor2;
  final double? radius;
  final Border? border;
  final double? fontSize;
  final Color? textColor;
  final Color? progressColor;
  final double? letterSpacing;
  final double? progressStrokeWidth;
  final double? progressPadding;
  final FontWeight fontWeight;

  final void Function()? onTap;

  const ButtonBig({
    super.key,
    required this.height,
    this.width,
    required this.backgroundColor,
    required this.backgroundColor2,
    required this.text,
    required this.showProgress,
    required this.radius,
    this.fontSize,
    this.border,
    this.textColor,
    this.letterSpacing,
    this.progressStrokeWidth,
    this.progressColor,
    this.onTap,
    required this.fontWeight,
    required this.progressPadding
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            //color: backgroundColor,
            gradient: LinearGradient(
                colors: [backgroundColor!, backgroundColor2!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0,1]
            ),
            border: border,
            borderRadius: BorderRadius.all(Radius.circular(radius!)),
        ),
        child: (showProgress==true)?Center(child: AspectRatio(
          aspectRatio: 1/1,
          child: Padding(
            padding: EdgeInsets.all(progressPadding!),
            child: CircularProgressWidget(
              color: progressColor,
              strokeWidth: progressStrokeWidth,
            ),
          ),
        )):
        Center(child: Text(text!,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: fontSize,
            color: textColor,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight
          )
        )) ,
      ),
    );
  }
}

