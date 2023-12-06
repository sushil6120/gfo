import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  //const AppBarBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
      },
      child: Icon(Icons.arrow_back_rounded,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
