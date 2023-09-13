import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tdee/core/screen_utils.dart';
import 'package:tdee/enums/selected_gender.dart';
import 'package:tdee/enums/selected_unit.dart';
import 'package:tdee/features/home/logic/change_height_cubit/change_height_cubit.dart';
import 'package:tdee/features/home/logic/change_weight_cubit/change_weight_unit_cubit.dart';
import 'package:tdee/features/home/logic/gender_select_cubit/gender_select_cubit.dart';
import 'package:tdee/features/home/presentation/widgets/custom_gender_button.dart';
import 'package:tdee/features/home/presentation/widgets/custom_text_field.dart';
import 'package:tdee/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ageTextController = TextEditingController();
  final TextEditingController weightTextController = TextEditingController();
  final TextEditingController heightTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("TDEE Calculator"),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(context.defaultPadding * 0.5),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                SizedBox(
                  height: context.defaultPadding,
                ),
                BlocBuilder<GenderSelectCubit, GenderSelectInitial>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomGenderButton(
                          onPressed: () {
                            BlocProvider.of<GenderSelectCubit>(context)
                                .selectMale();
                          },
                          buttonText: "Male",
                          icon: Icons.male,
                          bgColor: state.selectedGender == Gender.male
                              ? AppColors.activeColor
                              : AppColors.innactiveColor,
                        ),
                        CustomGenderButton(
                          onPressed: () {
                            BlocProvider.of<GenderSelectCubit>(context)
                                .selectFemale();
                          },
                          buttonText: "Female",
                          icon: Icons.female,
                          bgColor: state.selectedGender == Gender.female
                              ? AppColors.activeColor
                              : AppColors.innactiveColor,
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: context.defaultPadding,
                ),
                CustomTextField(
                  controller: ageTextController,
                  text: "Age",
                  keyboardType: TextInputType.number,
                ),
                Column(
                  children: [
                    BlocBuilder<ChangeUnitCubit, ChangeUnitInitial>(
                      builder: (context, weightState) {
                        return CustomTextField(
                          leadingTextClicked: () {
                            BlocProvider.of<ChangeUnitCubit>(context)
                                .selectKg();
                          },
                          trailingTextClicked: () {
                            BlocProvider.of<ChangeUnitCubit>(context)
                                .selectLb();
                          },
                          controller: weightTextController,
                          text: "Weight",
                          keyboardType: TextInputType.number,
                          isVisible: true,
                          leadingSuffixText: "Kg",
                          trailingSuffixText: "Lb",
                          trailingTextColor: weightState.weightUnit == Units.lb
                              ? AppColors.innactiveColor
                              : AppColors.activeColor,
                          trailingColor: weightState.weightUnit == Units.lb
                              ? primaryColor
                              : AppColors.innactiveColor,
                          leadingTextColor: weightState.weightUnit == Units.kg
                              ? AppColors.innactiveColor
                              : AppColors.activeColor,
                          leadingColor: weightState.weightUnit == Units.kg
                              ? primaryColor
                              : AppColors.innactiveColor,
                        );
                      },
                    ),
                    BlocBuilder<ChangeHeightCubit, ChangeHeightInitial>(
                      builder: (context, heightState) {
                        return CustomTextField(
                          leadingTextClicked: () {
                             BlocProvider.of<ChangeHeightCubit>(context)
                                .selectCm();
                          },
                          trailingTextClicked: () {
                            BlocProvider.of<ChangeHeightCubit>(context)
                                .selectFt();
                          },
                          controller: heightTextController,
                          text: "Height",
                          keyboardType: TextInputType.number,
                          isVisible: true,
                          leadingSuffixText: "cm",
                          trailingSuffixText: "ft",
                          trailingTextColor: heightState.heightUnit == Units.ft
                              ? AppColors.innactiveColor
                              : AppColors.activeColor,
                          trailingColor: heightState.heightUnit == Units.ft
                              ? primaryColor
                              : AppColors.innactiveColor,
                          leadingTextColor: heightState.heightUnit == Units.cm
                              ? AppColors.innactiveColor
                              : AppColors.activeColor,
                          leadingColor: heightState.heightUnit == Units.cm
                              ? primaryColor
                              : AppColors.innactiveColor,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: context.defaultPadding * 2,
                ),
                Container(
                  height: context.mQHeight * 0.08,
                  width: context.mQWidth,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        color: AppColors.innactiveColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
