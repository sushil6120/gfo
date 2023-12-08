import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';

class TextFormFieldBig extends StatelessWidget {
  //const TextFormFieldBig({Key? key}) : super(key: key);
  final double? height;
  final String? hintText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final bool? obscureText;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool? readOnly;
  final void Function()? onTap;
  final int maxlines;
  final String? labelText;
  final bool? enabled;
  final List<TextInputFormatter>? formaterss;

  const TextFormFieldBig(
      {super.key,
      required this.hintText,
      required this.height,
      this.controller,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboard,
      this.obscureText,
      this.onFieldSubmitted,
      this.focusNode,
      this.readOnly,
      this.onTap,
      this.enabled,
      this.formaterss,
      required this.maxlines,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        inputFormatters: formaterss,
        onTap: onTap,
        readOnly: readOnly ?? false,
        obscureText: obscureText!,
        controller: controller,
        keyboardType: keyboard,
        focusNode: focusNode,
        //expands: true,
        //maxLines: null,
        maxLines: maxlines,
        enabled: enabled,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).textTheme.headlineMedium!.color!,
            fontWeight: FontWeight.w400),
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            // fillColor: searchColor,
            filled: false,
            // filled: true,
            isDense: true,
            labelText: labelText,
            labelStyle: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 11, fontWeight: FontWeight.w400)
                    .color),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorStyle: const TextStyle(color: errorColor, fontSize: 12),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).textSelectionTheme.selectionColor),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 0.2,
                  color: Theme.of(context).textTheme.bodyMedium!.color!),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.2, color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: colorLight3),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: colorLight3),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: colorLight3),
            )),
      ),
    );
  }
}
