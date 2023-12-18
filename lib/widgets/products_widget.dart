import 'package:flutter/material.dart';
import 'package:gfo/utils/responsive.dart';

import '../utils/colors.dart';
import '../utils/valueConstants.dart';

class ProductsWidgets extends StatelessWidget {
  String? img;
  String? title;
  String? price;
  ProductsWidgets({super.key, this.img, this.price, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.deviceWidth * .4,
          height: context.deviceHeight * .25,
          margin: const EdgeInsets.only(
              top: verticalSpaceMedium, left: 18, right: 5),
          decoration: BoxDecoration(
              color: colorLightWhite,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    blurRadius: 30,
                    color: colorDark3.withOpacity(.2),
                    spreadRadius: 0,
                    offset: const Offset(0, 4))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: context.deviceHeight * .15,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(img!))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 8),
                child: Text(
                  price!,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
