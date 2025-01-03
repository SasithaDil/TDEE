import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdee/features/home/logic/change_height_cubit/change_height_cubit.dart';
import 'package:tdee/features/home/logic/change_weight_cubit/change_weight_unit_cubit.dart';
import 'package:tdee/features/home/logic/gender_select_cubit/gender_select_cubit.dart';
import 'package:tdee/routes/routes.dart' as router;
import 'package:tdee/utils/colors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GenderSelectCubit>(
          create: (context) => GenderSelectCubit(),
        ),
        BlocProvider<ChangeUnitCubit>(
          create: (context) => ChangeUnitCubit(),
        ),
        BlocProvider<ChangeHeightCubit>(
          create: (context) => ChangeHeightCubit(),
        ),
      ],
      child: MaterialApp(
          title: 'TDEE Calculator',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: router.Router.generateRoute,
          initialRoute: router.ScreenRoutes.toSplashScreen),
    );
  }
}
