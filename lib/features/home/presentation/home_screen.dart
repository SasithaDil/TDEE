import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tdee/core/screen_utils.dart';
import 'package:tdee/enums/selected_gender.dart';
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
                CustomTextField(
                  controller: weightTextController,
                  text: "Weight",
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  controller: heightTextController,
                  text: "Height",
                  keyboardType: TextInputType.number,
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
