import 'package:flutter/material.dart';
import 'package:recipe_cook_book/app/locator.dart';
import 'package:recipe_cook_book/app/router.dart';
import 'package:recipe_cook_book/datamodels/recipes.dart';

import 'package:recipe_cook_book/ui/views/home/widgets/extentions.dart';
import 'package:recipe_cook_book/constants/themes/light_color.dart';
import 'package:recipe_cook_book/ui/views/home/widgets/title_text.dart';
import 'package:stacked_services/stacked_services.dart';

class RecipeCard extends StatelessWidget {
  final Recipes recipe;
  final ValueChanged<Recipes> onSelected;
  final NavigationService _navigationService = locator<NavigationService>();
  RecipeCard({Key key, this.recipe, this.onSelected}) : super(key: key);

//   @override
//   _ProductCardState createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   Product product;
//   @override
//   void initState() {
//     product = widget.product;
//     super.initState();
//   }

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
      margin: EdgeInsets.symmetric(vertical: !recipe.isSelected ? 20 : 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          // alignment: Alignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                   recipe.isliked ? Icons.favorite : Icons.favorite_border,
                    color:
                        recipe.isliked ? LightColor.red : LightColor.iconColor,
                  ),
                  onPressed: () {},
                ),
                 TitleText(
                  text: recipe.category,
                  fontSize: recipe.isSelected ? 14 : 12,
                  color: LightColor.orange,
                ),
              ],
            ),
           
            // SizedBox(height: 1),
            SizedBox(height: recipe.isSelected ? 15 : 0),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(60.0),
              //  height: 150.0,
              //   width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(recipe.image),
                  ),
                ),
              ),
            ),
               // SizedBox(height: 5),
            TitleText(
              text: recipe.name,
              fontSize: recipe.isSelected ? 17 : 16,
            ),
             SizedBox(height: 5),
            
               // SizedBox(height: 5),
            TitleText(
              text: recipe.time.toString(),
              fontSize: recipe.isSelected ? 18 : 12,
            ),
          ],
        ),
      ).ripple(() {
        _navigationService.navigateTo(Routes.recipeDetailsViewRoute);
        //   Navigator.of(context).pushNamed('/detail');
        onSelected(recipe);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
