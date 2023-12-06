import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/themeServices/themeManager.dart';
import 'utils/routes/routes.dart';
import 'utils/routes/routesName.dart';
import 'utils/scrollBehavior.dart';
import 'viewmodel/indesViewModel.dart';

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
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),

            initialRoute: RoutesName.splashScreen,
            onGenerateRoute: Routes.generateRoute,
            scrollBehavior: MyBehavior(),
          );
        },
      ),
    );
  }
}
