import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';
import 'app/router.dart';
import 'constants/colors.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: true,
      title: 'Cookify',
      initialRoute: Routes.onboardingViewRoute,
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
