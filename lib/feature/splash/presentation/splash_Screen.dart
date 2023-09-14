import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/feature/home/presentation/pages/home_screen.dart';

import '../application/splash_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
            listener: (context, state) {
              if (state is SplashSuccess) {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              }
            },
            child: Center(
              child: CircularProgressIndicator(
                semanticsLabel: AppLocalizations.of(context).str_loading,
              ),
            )));
  }
}
