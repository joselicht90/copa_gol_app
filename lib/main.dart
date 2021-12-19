import 'package:copa_gol_app/blocs/app_bloc_observer.dart';
import 'package:copa_gol_app/blocs/global_bloc.dart';
import 'package:copa_gol_app/blocs/theme_bloc.dart';
import 'package:copa_gol_app/pages/forgot_password.dart';
import 'package:copa_gol_app/pages/home.dart';
import 'package:copa_gol_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

//test

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GlobalBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        )
      ],
      child: const MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      buildWhen: (previous, state) => previous.brightness != state.brightness,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Copa Gol',
          theme: context.read<ThemeCubit>().state,
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginPage(),
            '/': (context) => const HomePage(),
            '/forgot_password': (context) => const ForgotPasswordPage(),
          },
        );
      },
    );
  }
}
