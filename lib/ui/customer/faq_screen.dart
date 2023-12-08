import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/ui/globalWidgets/buttonBig.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/valueConstants.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        iconTheme: const IconThemeData(color: colorDark1),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
                left: 18,
                right: 18,
              ),
              child: Text(
                "Frequently Asked Questions:",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: verticalSpaceSmall2,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
            return   Container(
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.greenAccent.withOpacity(.3)
              ),
              child: Center(
                child: ExpandablePanel(

                  theme: const ExpandableThemeData(
                      expandIcon: Icons.keyboard_arrow_down_sharp,
                      collapseIcon: Icons.keyboard_arrow_up,
                      iconColor: colorDark1),
                  header: Text(
                    "Question Related GFO?",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                
                  collapsed: Container(
                
                  ), // empty container when collapsed
                  expanded: Padding(
                    padding:
                        const EdgeInsets.only(top: 2, bottom: 5, left: 0, right: 0),
                    child: Text(
                      "Receive an instructor-signed certificate with the institution’s logo to verify your achievement and increase your job prospects.:",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: colorDark1),
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            );
          },)
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
              text: "Submit your question",
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
