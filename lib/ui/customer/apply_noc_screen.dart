import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
import 'package:gfo/ui/globalWidgets/searchTextFormFieldBig.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/viewmodel/authviewmodel.dart';
import 'package:gfo/viewmodel/nocViewModel.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/utilsFunction.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/buttonBig.dart';

class ApplyNocScreen extends StatefulWidget {
  const ApplyNocScreen({super.key});

  @override
  State<ApplyNocScreen> createState() => _CustomerAddNewAddressScreenState();
}

class _CustomerAddNewAddressScreenState extends State<ApplyNocScreen> {
  String? selectedCity;
  DateTime selectedDate = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = selectedDate.toString();
      });
    }
  }

  SharedPreferencesViewModel sharedPreferencesViewModel =
      SharedPreferencesViewModel();
  String? token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.wait([sharedPreferencesViewModel.getToken()]).then((value) {
      token = value[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: colorDark1),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bell,
                  color: colorDark2,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.cart,
                  color: colorDark2,
                )),
            SizedBox(
              width: 5,
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: verticalSpaceSmall),
                  child: SearchTextFormFieldBig(
                    controller: nameController,
                    height: 55,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      } else {
                        return "";
                      }
                    },
                    hintText: "Name",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: verticalSpaceSmall),
                  child: SearchTextFormFieldBig(
                    controller: contactController,
                    height: 55,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      } else {
                        return "";
                      }
                    },
                    hintText: "Contact",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: verticalSpaceSmall),
                  child: SearchTextFormFieldBig(
                    controller: addressController,
                    height: 55,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      } else {
                        return "";
                      }
                    },
                    hintText: "Address",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: verticalSpaceSmall),
                  child: SearchTextFormFieldBig(
                    controller: placeController,
                    height: 55,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      } else {
                        return "";
                      }
                    },
                    hintText: "Place",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: verticalSpaceSmall),
                  child: SearchTextFormFieldBig(
                    controller: pincodeController,
                    height: 55,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      } else {
                        return "";
                      }
                    },
                    hintText: "Pin-code",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: verticalSpaceSmall),
                  child: SearchTextFormFieldBig(
                    controller: dateController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      } else {
                        return "";
                      }
                    },
                    onTap: () {
                      _selectDate(context);
                    },
                    height: 55,
                    hintText: "Date and Time",
                  ),
                ),
                SizedBox(
                  height: verticalSpaceSmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                  ),
                  child: SizedBox(
                    width: context.deviceWidth * .9,
                    child: DropdownSearch<String>(
                      items: ["Option 1", "Option 2"],
                      onChanged: (value) {
                        selectedCity = value!;
                        print(selectedCity);
                      },
                      clearButtonProps:
                          const ClearButtonProps(isVisible: false),
                      dropdownButtonProps: DropdownButtonProps(
                          constraints: const BoxConstraints(
                              maxWidth: bigButtonHeight,
                              maxHeight: bigButtonHeight),
                          isVisible: true,
                          color: Theme.of(context).textTheme.titleLarge!.color,
                          icon: const Icon(Icons.arrow_drop_down_rounded),
                          iconSize: 20),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                            filled: true,
                            fillColor: searchColor,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 14),
                            hintText: "Select Property type",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .textSelectionTheme
                                        .selectionColor),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.2,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color!),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(radiusValue))),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.2, color: errorColor),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(radiusValue))),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.transparent),
                                borderRadius: BorderRadius.all(Radius.circular(radiusValue))),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 0.2, color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(radiusValue)))),
                      ),
                      popupProps: PopupProps.menu(
                        searchDelay: const Duration(seconds: 0),
                        searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                                fillColor: colorLightWhite,
                                filled: true,
                                isDense: true,
                                hintText: "Search",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context).disabledColor),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .color,
                                ),
                                errorStyle: const TextStyle(
                                    color: errorColor, fontSize: 12),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 14),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.2,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color!),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(radiusValue))),
                                errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.2, color: errorColor),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(radiusValue))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color!),
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(radiusValue))),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.2, color: Theme.of(context).textTheme.headlineMedium!.color!), borderRadius: const BorderRadius.all(Radius.circular(radiusValue))))),
                        showSearchBox: true,
                        menuProps: MenuProps(
                          elevation: 4,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(radiusValue),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Consumer<NocViewModel>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
              child: ButtonBig(
                fontSize: 14,
                onTap: () {
                
                  if (nameController.text.isEmpty||contactController.text.isEmpty||addressController.text.isEmpty||placeController.text.isEmpty||pincodeController.text.isEmpty||dateController.text.isEmpty||selectedCity!.isEmpty) {
                      if (kDebugMode) {
                    print("working");
                  }
                    Utils.snackBar("fill all the fields.", context);
                  }else{
                     value.applyNocApis(
                        nameController.text,
                        placeController.text,
                        contactController.text,
                        addressController.text,
                        dateController.text,
                        pincodeController.text,
                        selectedCity.toString(),
                        token,
                        context);
                  }
                },
                backgroundColor: greenColor.withOpacity(.6),
                backgroundColor2: greenColor.withOpacity(.6),
                width: double.infinity,
                height: 55,
                text: "Submit",
                showProgress: value.loading,
                progressColor: colorLightWhite,
                progressStrokeWidth: 1.5,
                radius: 5,
                textColor: colorLightWhite,
                letterSpacing: 0,
                progressPadding: 20,
                fontWeight: FontWeight.w700,
              ),
            );
          },
        ));
  }
}
