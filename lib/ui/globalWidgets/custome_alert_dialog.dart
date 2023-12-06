import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Text? title;
  final Widget? content;
  final Widget? actionsWidget; // New: allows custom widget for actions
  final double? width;
  final double? height;

  CustomAlertDialog({
    this.title,
    this.content,
    this.actionsWidget,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: title != null ? title! : null,
      content: content != null
          ? SizedBox(
              width: width,
              height: height,
              child: SingleChildScrollView(
                child: content!,
              ),
            )
          : null,
      actions: <Widget>[
        if (actionsWidget != null) actionsWidget!,
      ],
    );
  }
}
