import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfo/utils/valueConstants.dart';

import '../../utils/colors.dart';
import '../../utils/routes/routesName.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text(
          "Role",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 18,
              color: colorLightWhite,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: verticalSpaceLarge,
            ),
            customeRoles("assets/user.svg", "Customer", () {
              Navigator.pushNamed(
                  context, RoutesName.bottomNavigationBarScreen);
            }),
            customeRoles("assets/user.svg", "Consultant", () {}),
            customeRoles("assets/user.svg", "Seller", () {
              Navigator.pushNamed(context, RoutesName.SellerBottomNavBar);
            }),
          ],
        ),
      ),
    );
  }

  Widget customeRoles(String img, String roles, VoidCallback ontap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: ontap,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      color: colorLight3.withOpacity(.6),
                      borderRadius: BorderRadius.circular(5)),
                  child: SvgPicture.asset(img)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              roles,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 16, color: colorDark1, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
