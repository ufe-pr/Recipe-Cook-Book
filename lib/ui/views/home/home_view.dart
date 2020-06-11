import 'package:flutter/material.dart';
import 'package:recipe_cook_book/ui/views/home/widgets/searchbar.dart';
import 'package:stacked/stacked.dart';

import 'package:recipe_cook_book/constants/colors.dart';
import 'package:recipe_cook_book/constants/themes/theme.dart';
import 'home_viewmodel.dart';
import 'package:recipe_cook_book/ui/views/home/widgets/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:recipe_cook_book/ui/views/home/widgets/recipe_card.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                model.title,
                style: AppTheme.h2Style.copyWith(
                  color: ThemeColors.lightOrange1,
                ),
              ),
              model.selectedIndex == 1 ? Container() : SearchBar(
                func: model.search
              ),
              Expanded(
                child: model.isBusy
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 30,
                          childAspectRatio: 3 / 4,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return RecipeCard(
                            recipe: model.data[index],
                          );
                        },
                        itemCount: model.data.length,
                      ),
              ),
            ],
          ),
        ),
        bottomSheet: CustomBottomNavigationBar(
          icon1: Icons.home,
          icon2: Icons.favorite,
          onIconPresedCallback: model.bottomNavbarPressed,
          selectedIndex: model.selectedIndex,
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
