import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gfo/ui/globalWidgets/textFormFieldBig.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/valueConstants.dart';

import '../../utils/colors.dart';
import '../globalWidgets/buttonBig.dart';
import '../globalWidgets/search_field.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "Review",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 16, fontWeight: FontWeight.w700, color: primaryColor),
        ),
        iconTheme: const IconThemeData(color: colorDark1),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bell, color: colorDark1),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.cart, color: colorDark1),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
              child: Text(
                "Score:",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceMedium),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: colorDark3.withOpacity(.4), width: .8)),
              child: SearchFields(
                textInpuType: TextInputType.phone,
                hintText: "Title",
                height: null,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: verticalSpaceSmall),
            child: TextFormField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "Review",
                hintStyle: TextStyle(color: colorLight3),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
            
                  borderSide: BorderSide(color: colorLight3, width: 1)
                )
              ),
            ),
          ),
          Container(
            width: context.deviceWidth,
            height: context.deviceHeight*.08,
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: verticalSpaceSmall),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: colorLight3, )
            ),
            child: Center(child: Icon(Icons.add, color: colorDark3,),),
          ),
             Container(
              margin: EdgeInsets.only(
                  left: 18, right: 18, ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: colorDark3.withOpacity(.4), width: .8)),
              child: SearchFields(
                textInpuType: TextInputType.phone,
                hintText: "Lable",
                height: null,
              ),
            ),
             Container(
              margin: EdgeInsets.only(
                  left: 18, right: 18,top: verticalSpaceSmall ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: colorDark3.withOpacity(.4), width: .8)),
              child: SearchFields(
                textInpuType: TextInputType.phone,
                hintText: "*Email",
                height: null,
              ),
            ),
          ],
        ),

      ),

      bottomNavigationBar: SizedBox(
        height: context.deviceHeight*.19,
        child: Column(
          children: [
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            child: ButtonBig(
              fontSize: 14,
              onTap: () {
                if (kDebugMode) {
                  print("working");
                }
                // Navigator.pushNamed(context, RoutesName.congrotulationsScreen);
              },
              backgroundColor: greenColor.withOpacity(.6),
              backgroundColor2: greenColor.withOpacity(.6),
              width: double.infinity,
              height: 55,
              text: "Post",
              showProgress: false,
              progressColor: colorLightWhite,
              progressStrokeWidth: 1.5,
              radius: 6,
              textColor: colorLightWhite,
              letterSpacing: 0,
              progressPadding: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, ),
            child: ButtonBig(
              border: Border.all(color: primaryColor),
              fontSize: 14,
              onTap: () {
                if (kDebugMode) {
                  print("working");
                }
                // Navigator.pushNamed(context, RoutesName.congrotulationsScreen);
              },
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundColor2: Theme.of(context).scaffoldBackgroundColor,
              width: double.infinity,
              height: 55,
              text: "Cancel",
              showProgress: false,
              progressColor: colorLightWhite,
              progressStrokeWidth: 1.5,
              radius: 6,
              textColor: primaryColor,
              letterSpacing: 0,
              progressPadding: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          ],
        ),
      ),
    );
  }
}
