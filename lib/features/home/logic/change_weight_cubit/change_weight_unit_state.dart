part of 'change_weight_unit_cubit.dart';

abstract class ChangeUnitState extends Equatable {
  const ChangeUnitState();

  @override
  List<Object> get props => [];
}

class ChangeUnitInitial extends ChangeUnitState {
  final Units weightUnit;

  const ChangeUnitInitial({required this.weightUnit});
  @override
  List<Object> get props => [weightUnit];
}
