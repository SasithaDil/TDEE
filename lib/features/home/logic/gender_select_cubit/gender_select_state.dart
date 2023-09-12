part of 'gender_select_cubit.dart';



abstract class GenderSelectState extends Equatable{
  const GenderSelectState();

  @override
  List<Object> get props => [];
}


class GenderSelectInitial extends GenderSelectState{
  final Gender selectedGender;
  const GenderSelectInitial({
    required this.selectedGender,
  });

  @override
  List<Object> get props => [selectedGender];
}
