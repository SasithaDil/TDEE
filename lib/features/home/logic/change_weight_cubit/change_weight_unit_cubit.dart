import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tdee/enums/selected_unit.dart';

part 'change_weight_unit_state.dart';

class ChangeUnitCubit extends Cubit<ChangeUnitInitial> {
  ChangeUnitCubit() : super(const ChangeUnitInitial(weightUnit: Units.kg));

  void selectKg() => emit(const ChangeUnitInitial(weightUnit: Units.kg));

  void selectLb() => emit(const ChangeUnitInitial(weightUnit: Units.lb));
}
