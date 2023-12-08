import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';

class ConsultantWalletScreen extends StatefulWidget {
  const ConsultantWalletScreen({super.key});

  @override
  State<ConsultantWalletScreen> createState() => _ConsultantWalletScreenState();
}

class _ConsultantWalletScreenState extends State<ConsultantWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
      ),
      child: Scaffold(
        
       appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.only(top: 25),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.consultantProfileScreen);
                      },
                      child: const CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                            "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg"),
                      ),
                    ),
                    Image.asset("assets/logo.png"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.consultantNotificationScreen);
                      },
                      child: const Icon(CupertinoIcons.bell,color:colorLightWhite,))
                  ],
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text('Hi, Amanda!',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[400])),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Total Balance',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$124.57',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                          Container(
                            width: 115,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text('Withdrawl',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('History',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                      itemCount: 8,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return (ListTile(
                          leading: Image.asset('assets/images/walletprofile.png'),
                          title: Text(
                            'Yara Khalil',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          subtitle: Text(
                            'Oct 14, 10:24 AM',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                          ),
                          trailing: Text(
                            '-\$15.00',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor),
                          ),
                        ));
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
