import 'package:flutter/material.dart';
import 'package:recipe_cook_book/ui/views/widgets/custom_appbar_icon.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/colors.dart';
import 'search_viewmodel.dart';
import 'package:recipe_cook_book/ui/views/home/widgets/recipe_card.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.nonReactive(
        builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(model.title),
          backgroundColor: ThemeColors.background,
          leading: AppBarCustomIcon(
            icon: Icons.arrow_back_ios,
            color: Colors.black54,
            size: 15,
            padding: 12,
            isOutLine: true,
            onPressed: model.popView,
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
      );
    }, viewModelBuilder: () {
      String keyword = ModalRoute.of(context).settings.arguments;
      return SearchViewModel(keyword);
    });
  }
}
