import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdee/enums/selected_gender.dart';

part 'gender_select_state.dart';

class GenderSelectCubit extends Cubit<GenderSelectInitial> {
  GenderSelectCubit()
      : super(const GenderSelectInitial(selectedGender: Gender.defalut));

  void selectMale() =>
      emit(const GenderSelectInitial(selectedGender: Gender.male));

  void selectFemale() =>
      emit(const GenderSelectInitial(selectedGender: Gender.female));
}
