import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_cook_book/app/locator.dart';
import 'package:recipe_cook_book/app/router.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final NavigationService _navigationService = locator<NavigationService>();
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFFF57D37),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
                Color(0xFFFABE9B),
                Color(0xFFFABE9B),
                // Color(0xFFF79D69),
                // Color(0xFFF57D37),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      PageScreens(
                        image: 'assets/images/onboarding1.png',
                        text1: 'Search for your\nFavorite Recipes',
                        text2:
                            'Find over 1000 recipes to use to prepare your Favorite meal',
                      ),
                      PageScreens(
                        image: 'assets/images/onboarding2.png',
                        text1: 'Use recipes to\nprepare meals',
                        text2:
                            'Find over 1000 recipes to use to prepare your meal',
                      ),
                      PageScreens(
                        image: 'assets/images/onboarding3.png',
                        text1: 'Save your Favorite\nRecipes',
                        text2:
                            'Saving your favorite recipe for another cook is just a click',
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                SizedBox(height: 130.0),
                _currentPage != _numPages - 1
                    ? Row(
                        //  crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            child: FlatButton(
                              onPressed: () {
                                _pageController.jumpToPage(_numPages);
                              },
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomRight,
                              child: FlatButton(
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? GestureDetector(
              onTap: () => _navigationService.replaceWith(Routes.homePageViewRoute),
              child: Container(
                height: 100.0,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Color(0xFFF57D37),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}

class PageScreens extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;

  const PageScreens({Key key, this.image, this.text1, this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                image,
              ),
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            text1,
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            text2,
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
        ],
      ),
    );
  }
}
