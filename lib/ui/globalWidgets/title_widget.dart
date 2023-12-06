import 'package:flutter/material.dart';

import '../../utils/valueConstants.dart';

class TitleWidget extends StatelessWidget {
  String? title;
  Widget? child;
  TitleWidget({super.key, this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 18,
          right: 18,
          top: verticalSpaceLarge * 0.5,
          bottom: verticalSpaceSmall * 0.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title!,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w800)),
          child!
        ],
      ),
    );
  }
}
