import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/model/consultant/consultantProfileModel.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gfo/ui/seller/seller_profile_detail_screen.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';

class ConsultantProfileScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  ConsultantProfileScreen({super.key, this.arguments});

  @override
  State<ConsultantProfileScreen> createState() =>
      _ConsultantProfileScreenState();
}

class _ConsultantProfileScreenState extends State<ConsultantProfileScreen> {
  SharedPreferencesViewModel sharedPreferencesViewModel =
      SharedPreferencesViewModel();
Data? profileData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileData = widget.arguments!['profileData'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Image.asset(
                  'assets/images/sellerprofile.png',
                )),
            title: Text(profileData!.name.toString().substring(0,1).toUpperCase()+profileData!.name!.substring(1),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            subtitle: Text(profileData!.phone.toString(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: colorDark3)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      print("working");
                    }
                    Navigator.pushNamed(
                        context, RoutesName.consultantProfileDetailScreen,arguments: {
                          "profileData":profileData
                        });
                  },
                  child: Text('Profile',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Wallet',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
                SizedBox(
                  height: 20,
                ),
                Text('My Promo Code',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RoutesName.consultantCoustomerReview);
                  },
                  child: Text('Customer Review',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Benefit',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
                SizedBox(
                  height: 20,
                ),
                Text('Terms & Conditions',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
                SizedBox(
                  height: 20,
                ),
                Text('Support',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    sharedPreferencesViewModel
                        .removeConsultantToken()
                        .then((value) {
                      sharedPreferencesViewModel.remove();
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutesName.splashScreen, (route) => false);
                    });
                  },
                  child: Text('Logout',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
