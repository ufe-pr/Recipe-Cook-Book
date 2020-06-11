import 'package:flutter/material.dart';
import 'package:recipe_cook_book/ui/views/home/widgets/extentions.dart';
import 'package:recipe_cook_book/constants/themes/light_color.dart';
import 'package:recipe_cook_book/constants/themes/theme.dart';
import 'package:recipe_cook_book/datamodels/category.dart';
import 'package:recipe_cook_book/ui/views/home/widgets/title_text.dart';

class RecipeIcon extends StatelessWidget {
  // final String imagePath;
  // final String text;
  final ValueChanged<Category> onSelected;
  final Category model;
  RecipeIcon({Key key, this.model, this.onSelected}) : super(key: key);

  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: model.isSelected
                    ? LightColor.background
                    : Colors.transparent,
                border: Border.all(
                  color: model.isSelected ? LightColor.orange : LightColor.grey,
                  width: model.isSelected ? 2 : 1,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: model.isSelected ? Color(0xfffbf2ef) : Colors.white,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  model.image != null
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            padding: EdgeInsets.all(30.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(model.image)),
                            ),
                          ),
                        )
                      : SizedBox(),
                  model.name == null
                      ? Container()
                      : Container(
                          child: TitleText(
                            text: model.name,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        )
                ],
              ),
            ).ripple(
              () {
                onSelected(model);
              },
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          );
  }
}
