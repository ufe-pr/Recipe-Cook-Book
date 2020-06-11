import 'package:recipe_cook_book/app/locator.dart';
import 'package:recipe_cook_book/app/router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardViewModel extends BaseViewModel {

  NavigationService _navigationService = locator<NavigationService>();

  int _index = 0;
  int get index => _index;

  void getStarted() {
    _navigationService.replaceWith(Routes.homeViewRoute);
  }

  void updateIndex(){
    _index++;
    notifyListeners();
  }

}
