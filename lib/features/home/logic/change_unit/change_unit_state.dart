part of 'change_unit_cubit.dart';

abstract class ChangeUnitState extends Equatable {
  const ChangeUnitState();

  @override
  List<Object> get props => [];
}

class ChangeUnitInitial extends ChangeUnitState {
  final WeightUnit weightUnit;

  const ChangeUnitInitial({required this.weightUnit});
  @override
  List<Object> get props => [weightUnit];
}
