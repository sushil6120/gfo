// import 'dart:convert';
// import 'dart:developer';
// import '../../utils/routes/routesName.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfo/ui/customer/all_products_screen.dart';
import 'package:gfo/ui/customer/cart_screen.dart';
import 'package:gfo/ui/customer/customer_home_Screen.dart';
import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/buttonBig.dart';
import 'history_messages_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>
    with WidgetsBindingObserver {
  //const BottomNavigationBarScreen({Key? key}) : super(key: key);

  //NotificationsServices notificationsServices = NotificationsServices();

  int selectedIndex = 0;

  List<IconData> iconList = [
    Icons.home,
    Icons.track_changes,
    Icons.message,
    Icons.person_outline_rounded,
  ];

  final screens = [
    const CustomerHomeScreen(),
    CustomerAllProductScreen(),
    const HistoryMessagesScreen(),
    const CartScreen(),
  ];

  var headers;
  var data;

  @override
  void initState() {
    //notificationsServices.requestNotificationPermission();
    //notificationsServices.firebaseInit();
    WidgetsBinding.instance.addObserver(this);

    //final sharedPreferencesViewModel = Provider.of<SharedPreferencesViewModel>(context, listen: false);
    //sharedPreferencesViewModel.saveIsInstalled(true);

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    //SharedPreferencesViewModel sharedPreferencesViewModel = SharedPreferencesViewModel();

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Theme.of(context).brightness,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Theme.of(context).brightness),
      child: WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
          extendBody: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: IndexedStack(
            index: selectedIndex,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 26,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primaryColor,
            unselectedItemColor: Theme.of(context).disabledColor,
            onTap: (index) => setState(() {
              selectedIndex = index;
              print("this is index $index");
              print("this is index $selectedIndex");
            }),
            currentIndex: selectedIndex,
            elevation: 10,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/Vector.svg",
                  color: selectedIndex == 1 ? primaryColor : colorLight3,
                ),
                label: 'Products',
              ),
              BottomNavigationBarItem(
          icon: SvgPicture.asset(
                  "assets/chat.svg",
                  color: selectedIndex == 2 ? primaryColor : colorLight3,
                ),
                label: 'History Message',
              ),
              BottomNavigationBarItem(
        icon: SvgPicture.asset(
                  "assets/shopping--bag.svg",
                  color: selectedIndex == 3 ? primaryColor : colorLight3,
                ),
        
                label: 'Cart',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.person),
              //   label: 'Chat',
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> dailogFunction(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radiusValue))),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Exit App",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Text(
          "Are you sure ?",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonBig(
                  onTap: () {
                    SystemNavigator.pop();
                  },
                  width: 75,
                  height: 40,
                  backgroundColor: Theme.of(context).canvasColor,
                  backgroundColor2: Theme.of(context).canvasColor,
                  text: "Yes",
                  showProgress: false,
                  radius: radiusValueSmall,
                  textColor: Theme.of(context).textTheme.titleSmall!.color,
                  progressPadding: 20,
                  fontWeight: FontWeight.w500),
              const SizedBox(width: 40),
              ButtonBig(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  width: 75,
                  height: 40,
                  backgroundColor: primaryColor,
                  backgroundColor2: primaryColor,
                  text: "No",
                  showProgress: false,
                  radius: radiusValueSmall,
                  textColor: colorLightWhite,
                  progressPadding: 20,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ],
      ),
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radiusValue))),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              "Exit App",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            content: Text(
              "Are you sure ?",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonBig(
                    onTap: () {
                      //SystemNavigator.pop();
                      Navigator.of(context).pop(true);
                    },
                    width: 75,
                    height: 40,
                    backgroundColor: Theme.of(context).canvasColor,
                    backgroundColor2: Theme.of(context).canvasColor,
                    text: "Yes",
                    showProgress: false,
                    radius: radiusValueSmall,
                    textColor: Theme.of(context).textTheme.titleSmall!.color,
                    progressPadding: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(width: 40),
                  ButtonBig(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    width: 75,
                    height: 40,
                    backgroundColor: primaryColor,
                    backgroundColor2: primaryColor,
                    text: "No",
                    showProgress: false,
                    radius: radiusValueSmall,
                    textColor: colorLightWhite,
                    progressPadding: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }
}
