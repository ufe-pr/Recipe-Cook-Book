import 'package:stacked/stacked.dart';
import 'package:recipe_cook_book/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/router.dart';
import '../../../core/models/recipe.dart';
import '../../../core/services/api.dart';
import '../../../core/services/saved_recipes.dart';

class HomeViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  List<Recipe> _recipes;

  List<Recipe> get recipes => _recipes;

  HomeViewModel() {
    setBusy(true);
    upDateRecipes();
  }

  String get title => _selectedIndex == 0
      ? 'Find the best recipe for you'
      : 'Here are your favourite recipes';

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  Future upDateRecipes() async {
    _recipes = await (_selectedIndex == 0
        ? locator<Api>().getAllRecipes(numPerPage: 100)
        : locator<SavedRecipesService>().getAllRecipes(numPerPage: 100));
    setBusy(false);
    notifyListeners();
  }

  void search(String keyword) {
    _navigationService.navigateTo(Routes.searchViewRoute, arguments: keyword);
  }

  void bottomNavbarPressed(int selectedIndex) {
    setBusy(true);
    notifyListeners();
    _selectedIndex = selectedIndex;
    upDateRecipes();
  }
}
