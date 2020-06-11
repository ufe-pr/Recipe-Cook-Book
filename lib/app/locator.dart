import 'package:get_it/get_it.dart';
import 'package:recipe_cook_book/core/services/api.dart';
import 'package:recipe_cook_book/core/services/saved_recipes.dart';
import 'package:recipe_cook_book/core/services/storage_util_service.dart';
import 'package:stacked_services/stacked_services.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Api());
  locator.registerSingletonAsync(() => StorageUtil.getInstance());
  locator.registerSingletonWithDependencies(() => SavedRecipesService(), dependsOn: [StorageUtil]);
}