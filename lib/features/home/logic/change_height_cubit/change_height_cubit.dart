import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tdee/enums/selected_unit.dart';

part 'change_height_state.dart';

class ChangeHeightCubit extends Cubit<ChangeHeightInitial> {
  ChangeHeightCubit() : super(const ChangeHeightInitial(heightUnit: Units.cm));

    void selectCm() => emit(const ChangeHeightInitial(heightUnit: Units.cm));

    void selectFt() => emit(const ChangeHeightInitial(heightUnit: Units.ft));
}
