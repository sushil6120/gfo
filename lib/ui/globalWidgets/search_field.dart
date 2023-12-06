import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';

class SearchFields extends StatelessWidget {
  //const SearchFields({Key? key}) : super(key: key);
  final double? height;
  final String? hintText;
  final Icon? prefixIcon;
  final TextInputType? textInpuType;
  final List<LengthLimitingTextInputFormatter>? lengthLimitingTextInputFormatter;
  final Widget? suffixIcon;
  final String Function(String?)? validator;
  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String)? onSubmited;

  const SearchFields(
      {super.key,
      required this.hintText,
      required this.height,
      this.controller,
      this.validator,
      this.lengthLimitingTextInputFormatter,
      this.textInpuType,
      this.prefixIcon,
      this.suffixIcon,
      this.onSubmited,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: TextField(
        keyboardType: textInpuType,
        inputFormatters:lengthLimitingTextInputFormatter ,
        onTap: onTap,
        readOnly: false,
        controller: controller,
        // expands: true,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).textTheme.headlineMedium!.color!,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorStyle: const TextStyle(color: colorLight3, fontSize: 12),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
              color: colorDark3.withOpacity(.8)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: errorColor),
              borderRadius:
                  const BorderRadius.all(Radius.circular(15))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: errorColor),
              borderRadius:
                  const BorderRadius.all(Radius.circular(15))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.transparent),
              borderRadius:
                  const BorderRadius.all(Radius.circular(15))),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.transparent),
              borderRadius:
                  const BorderRadius.all(Radius.circular(15))),
        ),
        onSubmitted:onSubmited ,
      ),
    );
  }
}
