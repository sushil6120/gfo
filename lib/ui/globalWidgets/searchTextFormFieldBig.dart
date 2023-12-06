import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';

class SearchTextFormFieldBig extends StatelessWidget {
  //const SearchTextFormFieldBig({Key? key}) : super(key: key);
  final double? height;
  final String? hintText;
  final Widget? prefixIcon;
  final String? prefixText;
  final bool? enable;
  final String? labale;
  final Widget ? suffix;
  final Icon? suffixIcon;
  final String Function(String?)? validator;
  final TextEditingController? controller;
  final void Function()? onTap;

  const SearchTextFormFieldBig(
      {super.key,
       this.hintText,
      required this.height,
      this.controller,
      this.enable,
      this.suffix,
      this.validator,
      this.labale,
      this.prefixIcon,
      this.prefixText,
      this.suffixIcon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: TextFormField(
        enabled: enable,
        onTap: onTap,
        readOnly: false,
        controller: controller,
        expands: true,
        maxLines: null,
        minLines: null,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 16,
            color: Theme.of(context).textTheme.headlineMedium!.color!),
        validator: validator,
        cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
        decoration: InputDecoration(
          labelText: labale,
        labelStyle: TextStyle(
          fontSize: 13,
                color: Theme.of(context).textSelectionTheme.selectionColor),
          prefixText:prefixText ,
          prefixStyle:Theme.of(context).textTheme.titleMedium!.copyWith(

                color: colorDark1
               ) ,
               suffix: suffix,
            prefix: prefixIcon,
            suffixIcon: suffixIcon,
            errorStyle: const TextStyle(color: colorLight3, fontSize: 12),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Theme.of(context).textSelectionTheme.selectionColor),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Theme.of(context).disabledColor),
                borderRadius:
                    const BorderRadius.all(Radius.circular(radiusValue))),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Theme.of(context).disabledColor),
                borderRadius:
                    const BorderRadius.all(Radius.circular(radiusValue))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Theme.of(context).primaryColor),
                borderRadius:
                    const BorderRadius.all(Radius.circular(radiusValue))),
                    disabledBorder:OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Theme.of(context).primaryColor),
                borderRadius:
                    const BorderRadius.all(Radius.circular(radiusValue))),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Theme.of(context).primaryColor),
                borderRadius:
                    const BorderRadius.all(Radius.circular(radiusValue)))),
      ),
    );
  }
}
