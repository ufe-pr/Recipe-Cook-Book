import 'package:recipe_cook_book/app/locator.dart';
import 'package:recipe_cook_book/app/router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {
  
int currentPage = 0;

  final NavigationService _navigationService = locator<NavigationService>();
  

  void changeSwitch(value) {
    currentPage = value;
    notifyListeners();
  }

  Future setup() async {
    await Future.delayed(Duration(milliseconds: 200));
    await _navigationService.replaceWith(Routes.homePageViewRoute);
  }

  
}