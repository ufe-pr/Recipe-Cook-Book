import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_cook_book/ui/views/home/home_view.dart';
import 'package:recipe_cook_book/ui/views/home/pages/mainPage.dart';

import 'package:recipe_cook_book/ui/views/home/pages/recipe_detail.dart';
import 'package:recipe_cook_book/ui/views/onboarding_screen/onboarding_screen_view.dart';
import 'package:recipe_cook_book/ui/views/startup/startup_view.dart';

abstract class Routes {
  static const startupViewRoute = '/'; //
  static const onboardingViewRoute = '/';
  static const homePageViewRoute = '/homepage';
  static const recipeDetailsViewRoute = '/productdetails';
  static const homeViewRoute = '/home';
}

class Router {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
    //   case Routes.startupViewRoute:
    //     return CupertinoPageRoute<dynamic>(
    //       builder: (context) => StartupView(),
    //       settings: settings,
    //     );
      case Routes.onboardingViewRoute:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => OnboardingScreen(),
          settings: settings,
        );
      case Routes.homePageViewRoute:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => MainPage(),
          settings: settings,
        );
      case Routes.recipeDetailsViewRoute:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => RecipeDetailView(),
          settings: settings,
        );
      case Routes.homeViewRoute:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// borrowed from auto_route:
// returns an error page routes with a helper message.
PageRoute unknownRoutePage(String routeName) => MaterialPageRoute(
      builder: (ctx) => Scaffold(
        body: Container(
          color: Colors.redAccent,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text(
                  routeName == "/"
                      ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                      : 'Route name $routeName is not found!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              OutlineButton.icon(
                label: Text('Back'),
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ),
      ),
    );
