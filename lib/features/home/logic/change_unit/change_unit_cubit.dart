import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tdee/enums/selected_unit.dart';

part 'change_unit_state.dart';

class ChangeUnitCubit extends Cubit<ChangeUnitInitial> {
  ChangeUnitCubit() : super(const ChangeUnitInitial(weightUnit: WeightUnit.kg));

  void selectKg() => emit(const ChangeUnitInitial(weightUnit: WeightUnit.kg));

  void selectLb() => emit(const ChangeUnitInitial(weightUnit: WeightUnit.lb));
}
