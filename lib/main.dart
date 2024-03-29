import 'package:flutter/material.dart';
import 'package:gfo/viewmodel/addressViewModel.dart';
import 'package:gfo/viewmodel/authviewmodel.dart';
import 'package:gfo/viewmodel/consultant/consultantGetBookedAllUser.dart';
import 'package:gfo/viewmodel/nocViewModel.dart';
import 'package:gfo/viewmodel/seller/addProductViewModel.dart';
import 'package:provider/provider.dart';

import 'services/themeServices/themeManager.dart';
import 'utils/routes/routes.dart';
import 'utils/routes/routesName.dart';
import 'utils/scrollBehavior.dart';
import 'viewmodel/cartViewModel.dart';
import 'viewmodel/consultantViewmodel.dart';
import 'viewmodel/homeViewModel.dart';
import 'viewmodel/indesViewModel.dart';
import 'viewmodel/searchViewModel.dart';
import 'viewmodel/seller/sellerHomeViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManager()),
        ChangeNotifierProvider(create: (_) => IndexViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CosultantViewModel()),
        ChangeNotifierProvider(create: (_) => NocViewModel()),
        ChangeNotifierProvider(create: (_) => AddressViewModel()),
        ChangeNotifierProvider(create: (_) => ConsultantViewModelHome()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => AddProductViewModel()),
        ChangeNotifierProvider(create: (_) => SellerHomeViewModel()),
        ChangeNotifierProvider(create: (_) => SearchViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeManager = Provider.of<ThemeManager>(context);
          return MaterialApp(
            useInheritedMediaQuery: true,
            themeMode: themeManager.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            title: 'GFO',
            initialRoute: RoutesName.splashScreen1,
            onGenerateRoute: Routes.generateRoute,
            scrollBehavior: MyBehavior(),
          );
        },
      ),
    );
  }
}
