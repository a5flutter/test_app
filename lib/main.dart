import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/bloc/authentication_check_bloc/authentication_check_bloc.dart';
import 'package:test_app/theme/colors.dart';

import 'package:test_app/ui/navigation/routes.dart';
import 'package:test_app/ui/navigation/screens.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/authentication_bloc/authentication_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthenticationCheckBloc()),
          BlocProvider(create: (context) => AuthenticationBloc()),
        ],
        child: Builder(
          builder: (context) {
            return BlocBuilder<AuthenticationCheckBloc,
                AuthenticationCheckState>(
              builder: (context, state) {
                BlocProvider.of<AuthenticationCheckBloc>(context)
                    .add(CheckAuthStatus());
                if (state is AuthenticationCheckInitial) {
                  return Container(
                      color: accentWhite,
                      child: Center(child: CircularProgressIndicator()));
                }
                return MaterialApp(
                  initialRoute:
                      (state is Registered) ? Screens.home : Screens.welcome,
                  routes: appRoutes,
                );
              },
            );
          },
        ));
  }
}
