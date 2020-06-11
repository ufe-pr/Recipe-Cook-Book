import 'package:injectable/injectable.dart';
import 'package:recipe_cook_book/core/models/recipe.dart';
import 'api.dart';
import 'storage_util_service.dart';
import 'package:recipe_cook_book/app/locator.dart';

@lazySingleton
class SavedRecipesService{

  static const String preferenceName = 'SAVED_RECIPES';

  static StorageUtil _storage = locator<StorageUtil>();
  List<String> _list;

  SavedRecipesService() : _list = _storage.getStringList(preferenceName);

  _save() async {
    await _storage.putStringList(preferenceName, _list);
  }

  // Add recipe
  void addRecipe(int recipeId) async {
    // Add logic here
    _list.add(recipeId.toString());
    await _save();
  }

  // Remove the recipe matching the "recipeId" provided
  removeRecipe(int recipeId) async {
    // Add logic here
    _list.removeWhere((element) => element == recipeId.toString());
    await _save();
  }

  // Gets all recipes
  Future<List<Recipe>> getAllRecipes({int page: 1, int numPerPage: 10}) async {
    // Add logic here
    return Future.wait(_list.map((e) => locator<Api>().getRecipe(int.parse(e))).toList());
  }

}