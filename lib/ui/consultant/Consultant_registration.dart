import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/ui/globalWidgets/searchTextFormFieldBig.dart';

import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/buttonBig.dart';

class ConsultantRegistratinScreen extends StatefulWidget {
  const ConsultantRegistratinScreen({super.key});

  @override
  State<ConsultantRegistratinScreen> createState() =>
      _ConsultantRegistratinScreenState();
}

class _ConsultantRegistratinScreenState
    extends State<ConsultantRegistratinScreen> {
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
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, top: verticalSpaceSmall2, bottom: 10),
              child: Text(
                "Registration",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "Full Name",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "contact",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "Email Id",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "Adhar Number",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "Pan No",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "Education",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "Current or ex-designation ",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "Experience",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "Address",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "Pin code",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: colorLight2.withOpacity(.2),
                    hintText: "Bio...",
                    hintStyle: TextStyle(color: colorLight3),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: colorLight3, width: 1))),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: Container(
                decoration: BoxDecoration(color: colorLight3.withOpacity(.1),borderRadius: BorderRadius.circular(5)),
                child:Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Upload Adhar Card",style: TextStyle(fontSize:12),),
                      Icon(Icons.upload),
                    ],
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: Container(
                decoration: BoxDecoration(color: colorLight3.withOpacity(.1),borderRadius: BorderRadius.circular(5)),
                child:Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Upload Pen Card",style: TextStyle(fontSize:12),),
                      Icon(Icons.upload),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
              child: Container(
                decoration: BoxDecoration(color: colorLight3.withOpacity(.1),borderRadius: BorderRadius.circular(5)),
                child:Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Upload Education Documents",style: TextStyle(fontSize:12),),
                      Icon(Icons.upload),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "Account holder name",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "Account no.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "Re-enter account no.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceSmall),
              child: SearchTextFormFieldBig(
                height: 55,
                hintText: "IFSC Code",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
        child: ButtonBig(
          fontSize: 14,
          onTap: () {
            if (kDebugMode) {
              print("working");
            }
            // Navigator.pushNamed(context, RoutesName.checkOutScreen);
          },
          backgroundColor: greenColor.withOpacity(.6),
          backgroundColor2: greenColor.withOpacity(.6),
          width: double.infinity,
          height: 55,
          text: "Save",
          showProgress: false,
          progressColor: colorLightWhite,
          progressStrokeWidth: 1.5,
          radius: 5,
          textColor: colorLightWhite,
          letterSpacing: 0,
          progressPadding: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
