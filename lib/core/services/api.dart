import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_cook_book/core/models/recipe.dart';

class RecipeResponse {
  static RecipeResponse _response;
  static List<Map<String, dynamic>> _data;

  static Future<RecipeResponse> getInstance() async {
    if (_response == null) {
      RecipeResponse res = RecipeResponse._();
      await res._init();
      _response = res;
    }

    return _response;
  }

  Future _init() async {
    _data = await _loadJson();
  }

  static const _endpoint = 'assets/api/json_response.json';
  // Function for loading json from assets
  Future<List<Map<String, dynamic>>> _loadJson() async {
    // Load the string data from assets
    String data = await rootBundle.loadString(_endpoint);

    // return decoded json
    var js = (json.decode(data) as List)?.map((e) => e as Map<String, dynamic>)?.toList();
    return js;
  }

  RecipeResponse._();

  List<Map<String, dynamic>> get response => _data;
}

// The class responsible for retrieving data
@lazySingleton
class Api {
  // Gets the recipe matching the "recipeId" provided
  Future<Recipe> getRecipe(int recipeId) async {
    // Add logic here

    // Get the json response
    RecipeResponse response = await RecipeResponse.getInstance();

    Recipe recipe;

    // Return a the recipe if it exists else return null
    Map<String, dynamic> item = response.response
        .firstWhere((element) => element['id'] == recipeId, orElse: () => null);
    if (item != null) recipe = Recipe.fromJson(item);
    return recipe;
  }

  // Gets all recipes
  Future<List<Recipe>> getAllRecipes({int page: 1, int numPerPage: 10}) async {
    // Add logic here

    // load json data
    RecipeResponse response = await RecipeResponse.getInstance();

    List items = response.response;
    List<Recipe> recipes;

    //
    // Return the recipe if it exists else return an empty list
    //

    if (items != null) {

      // get start of sublist. return null if there's no result in that position
      int start = (page - 1) * numPerPage;
      if (start > items.length) {
        print('Start is greater than items length\n\n\n\n\n');
        return null;
      }

      // get end of sublist
      int end = start + numPerPage;
      if (end > items.length) end = items.length;

      // Instantiate List of recipes
      recipes = items
          .getRange(start, end)
          .map((elem) => Recipe.fromJson(elem))
          .toList();
    }

    return recipes ?? List<Recipe>();
  }

  // Gets all recipes with "recipeTitle" matching the "keyword" provided
  // It doesn't have to be a full match but should contain the keyword
  // RegExp should be able to handle it
  Future<List<Recipe>> searchRecipe(String keyword,
      {page: 1, int numPerPage: 10}) async {
    // Add logic here


    // Get the json response
    RecipeResponse response = await RecipeResponse.getInstance();

    List<Recipe> recipes;

    // Build regex to use for searching
//    RegExp regex = RegExp(keyword);

    //
    // Return the recipe if it exists else return an empty list
    //

    // Filter items to contain only those matching the search
    List<Map<String, dynamic>> items =
        response.response.where((element) {
          String title = element['title'].toLowerCase();
          bool match = title.contains(keyword.trim().toLowerCase());
          print('$title returns $match');
          return match;
        }).toList();
    if (items != null) {

      // get start of sublist. return null if there's no result in that position
      int start = (page - 1) * numPerPage;
      if (start > items.length) {
        return null;
      }

      // get end of sublist
      int end = start + numPerPage;
      if (end > items.length) end = items.length;
      recipes = items
          .getRange(start, end)
          .map((element) => Recipe.fromJson(element))
          .toList();
    }
    return (recipes ?? List<Recipe>());
  }
}
