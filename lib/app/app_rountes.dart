import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/feature/home/presentation/pages/home_screen.dart';
import 'package:to_do_app/feature/splash/presentation/splash_Screen.dart';
import 'package:to_do_app/injection_container.dart';

import '../Error/error_screen.dart';
import '../feature/splash/application/splash_cubit.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    late Route<dynamic> pageRoute;

    switch (routeSettings.name) {
      case SplashScreen.routeName:
        pageRoute = MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<SplashCubit>()..splashLoading(),
                  child: const SplashScreen(),
                ));
        break;

      case HomeScreen.routeName:
        pageRoute = MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
        break;

      default:
    }
    return pageRoute;
  }

  static Route<dynamic> onUnknownRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(builder: (_) => const ErrorPage());
  }
}
