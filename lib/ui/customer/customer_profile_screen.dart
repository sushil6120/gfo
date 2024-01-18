import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gfo/ui/seller/seller_profile_detail_screen.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/routes/routesName.dart';
import 'package:gfo/utils/valueConstants.dart';

class CustomerProfileScreen extends StatefulWidget {
  const CustomerProfileScreen({super.key});

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  SharedPreferencesViewModel sharedPreferencesViewModel =
      SharedPreferencesViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: colorDark1),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14, fontWeight: FontWeight.w400, color: colorDark1),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.deviceWidth,
            margin: EdgeInsets.only(
                left: 0, right: 9, top: 9, bottom: verticalSpaceSmall),
            decoration: BoxDecoration(
                color: colorLightWhite,
                borderRadius: BorderRadius.circular(10),
                ),
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Image.asset(
                    'assets/images/sellerprofile.png',
                  )),
              title: Text('Andrea Hirata',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: colorDark1)),
              subtitle: Text('9987654321',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: colorDark3)),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (kDebugMode) {
                          print("working");
                        }
                        Navigator.pushNamed(
                            context, RoutesName.SellerProfileDetailScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                                                    Icon(
                            Icons.person_outlined,
                            size: 20,
                          ),
                          SizedBox(width:10,),
                          Text('Profile',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: colorDark1)),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                   
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.orderScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Icon(
                            CupertinoIcons.cube_box,
                            size: 20,
                          ),
                          SizedBox(width: 10,),
                          Text('Order',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: colorDark1)),
                         
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                   
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.reviewScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            Icon(
                            Icons.reviews_outlined,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text('Review',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: colorDark1)),
                        
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                   
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.privacyPolicyScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Icon(
                            Icons.privacy_tip_outlined,
                            size: 20,
                          ),
                          SizedBox(width: 10,),
                          Text('Privacy Policy ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: colorDark1)),
                         
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                   
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.faqScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Icon(
                            CupertinoIcons.question_circle,
                            size: 20,
                          ),
                          SizedBox(width: 10,),
                          Text('Faq',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: colorDark1)),
                         
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                   
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Icon(
                          Icons.headset_mic_outlined,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('Support ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: colorDark1)),
                       
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                   
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    sharedPreferencesViewModel.removeToken().then((value) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutesName.splashScreen, (route) => false);
                    });
                  },
                  child:Row(
                    children: [
                       Icon(
                          Icons.logout_outlined,
                          size: 20,
                          color: primaryColor,
                        ),
                        SizedBox(width: 10),
                       Text('Logout',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: primaryColor)),
                    ],
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
