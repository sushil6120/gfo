import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadingTextWidget extends StatelessWidget {

  final String? text;
  const HeadingTextWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text!,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.bold
      ),
    );
  }
}
