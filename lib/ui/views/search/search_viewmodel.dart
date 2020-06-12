

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../core/models/recipe.dart';
import '../../../core/services/api.dart';
import '../../../core/services/saved_recipes.dart';

class SearchViewModel extends FutureViewModel{
  final String searchKeyword;
  NavigationService _navigationService = locator<NavigationService>();

  SearchViewModel(this.searchKeyword);

  String get title => 'Searching for \'$searchKeyword\'';

  @override
  Future<List<Recipe>> futureToRun() async {
    return (await locator<Api>().searchRecipe(searchKeyword, numPerPage: 20));
  }

  void popView() {
    _navigationService.back();
  }

}