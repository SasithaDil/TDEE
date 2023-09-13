part of 'change_height_cubit.dart';

abstract class ChangeHeightState extends Equatable {
  const ChangeHeightState();

  @override
  List<Object> get props => [];
}

class ChangeHeightInitial extends ChangeHeightState {
  final Units heightUnit;

  const ChangeHeightInitial({required this.heightUnit});
  
  @override
  List<Object> get props => [heightUnit];
}
