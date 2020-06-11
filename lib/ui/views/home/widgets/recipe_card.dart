import 'package:flutter/material.dart';
import 'package:recipe_cook_book/app/locator.dart';
import 'package:recipe_cook_book/app/router.dart';

import 'package:recipe_cook_book/ui/views/home/widgets/extentions.dart';
import 'package:recipe_cook_book/constants/themes/light_color.dart';
import 'package:recipe_cook_book/ui/views/home/widgets/title_text.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../core/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final NavigationService _navigationService = locator<NavigationService>();
  RecipeCard({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LightColor.background,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 20 ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(60.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: recipe.imageAssetPath != null ? AssetImage(recipe.imageAssetPath) : NetworkImage(recipe.imageUrl),
                  ),
                ),
              ),
            ),

            TitleText(
              text: recipe.recipeTitle,
              fontSize: 16,
            ),

          ],
        ),
      ).ripple(() {
        _navigationService.navigateTo(Routes.recipeDetailsViewRoute, arguments: recipe);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
