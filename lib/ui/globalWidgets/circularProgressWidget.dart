import 'package:flutter/material.dart';

class CircularProgressWidget extends StatelessWidget {
  //const CircularProgressIndicator({Key? key}) : super(key: key);
  Color? color;
  double? strokeWidth;
  CircularProgressWidget({super.key, required this.color, required this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
      strokeWidth: strokeWidth!,
    );
  }
}
