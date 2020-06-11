import 'package:stacked/stacked.dart';
import 'package:recipe_cook_book/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/router.dart';
import '../../../core/models/recipe.dart';
import '../../../core/services/api.dart';
import '../../../core/services/saved_recipes.dart';

class HomeViewModel extends FutureViewModel{
  NavigationService _navigationService = locator<NavigationService>();

  String get title => _selectedIndex == 0 ? 'Find the best recipe for you' : 'Here are your favourite recipes';

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  @override
  Future<List<Recipe>> futureToRun() async {
    return await (_selectedIndex == 0 ? locator<Api>().getAllRecipes() : locator<SavedRecipesService>().getAllRecipes());
  }

  void search(String keyword) {
    _navigationService.navigateTo(Routes.startupViewRoute);
  }

  void bottomNavbarPressed(int selectedIndex) {
    _selectedIndex = selectedIndex;
    notifyListeners();
  }
}