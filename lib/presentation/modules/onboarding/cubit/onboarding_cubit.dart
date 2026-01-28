import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharexe/data/datasources/local/app_preferences.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit(this._appPreferences) : super(0);

  final AppPreferences _appPreferences;

  void onPageChanged(int pageIndex) {
    emit(pageIndex);
  }

  Future<void> completeOnboarding() async {
    await _appPreferences.markOnboardingCompleted();
  }
}
