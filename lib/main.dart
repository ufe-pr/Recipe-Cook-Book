import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';
import 'app/router.dart';

void main() {
  setupLocator();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: true,
      title: 'Cookify',
      initialRoute: Routes.startupViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      // theme: CupertinoThemeData(
      //     primaryColor: ThemeColors.lightOrange1,
      //     barBackgroundColor: ThemeColors.background,
      //     scaffoldBackgroundColor: ThemeColors.background,
      //     textTheme: CupertinoTextThemeData(
      //       navActionTextStyle: TextStyle(
      //         color: ThemeColors.lightOrange1,
      //       ),
      //       navTitleTextStyle: TextStyle(
      //         color: ThemeColors.lightOrange1,
      //       ),
      //       textStyle: TextStyle(
      //         fontFamily: 'Lato',
      //         fontWeight: FontWeight.w500,
      //       ),
      //     ),
      //   ),
    );
  }
}
