import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'onboarding_viewmodel.dart';

class OnBoardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    
    var images = ['search', 'use', 'save'];

    var titles = [
      'Search for your favorite recipes',
      'Use recipes to prepare meals',
      'Save your favorite recipes'
    ];

    var subtitles = [
      'With our app, you can find over a 1000 recipes to use to prepare your meal',
      'With our app, the list of sumptuous meals you can prepare is endless',
      'With our app, you can save recipes to use later'
    ];

    // var image = images[model.index];

    return ViewModelBuilder<OnboardViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Scaffold(
            body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage(
                            'assets/images/${(images[model.index])}.png'),
                        height: 200,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(titles[model.index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfff57d37),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(subtitles[model.index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff9d9e9e), fontSize: 14)),
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
                  ProgressContainer(
                      color: Color(model.index == 0 ? 0xffF25C05 : 0xffcececf)),
                  SizedBox(width: 6.5),
                  ProgressContainer(
                      color: Color(model.index == 1 ? 0xffF25C05 : 0xffcececf)),
                  SizedBox(width: 6.5),
                  ProgressContainer(
                      color: Color(model.index == 2 ? 0xffF25C05 : 0xffcececf))
                ]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(19.0, 42, 16, 42),
                  child: model.index < 2
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  // router.onGenerateRoute()
                                },
                                child: Text('Skip',
                                    style: TextStyle(
                                        color: Color(0xff6d6d6e),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14))),
                            RaisedButton(
                              
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              onPressed: () {
                                model.updateIndex();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              color: Color(0xffF25C05),
                              child: Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        )
                      : Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                  padding: EdgeInsets.only(top: 15, bottom: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  color: Color(0xffF25C05),
                                  child: Text('Get Started',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: model.getStarted),
                            ),
                          ],
                        ),
                )
              ],
            ),
          ),
        )),
      ),
      viewModelBuilder: () => OnboardViewModel(),
    );
  }
}

class ProgressContainer extends StatelessWidget {
  final Color color;
  const ProgressContainer({
    this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
            color: this.color, borderRadius: BorderRadius.circular(4)));
  }
}
