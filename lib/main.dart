import 'package:safetycheck/bloc/change_password/change_password_bloc.dart';
import 'package:safetycheck/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:safetycheck/bloc/profil/profile_bloc.dart';
import 'package:safetycheck/bloc/reset_password/reset_password_bloc.dart';
import 'package:safetycheck/data/datasources/auth_datasources.dart';
import 'package:safetycheck/data/localsources/auth_local_storage.dart';
import 'package:safetycheck/providers/dashboard_provider.dart';
import 'package:safetycheck/views/dashboard/login_page.dart';
import 'package:safetycheck/views/dashboard/started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:safetycheck/bloc/login/login_bloc.dart';
import 'package:safetycheck/bloc/register/register_bloc.dart';

import 'package:safetycheck/views/dashboard/dashboard_view.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider untuk DashboardProvider
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
        // ChangeNotifierProvider untuk BeritaPanelProvider
        ChangeNotifierProvider(
          create: (context) => BeritaPanelProvider(),
        ),
        // BlocProvider untuk RegisterBloc
        BlocProvider(
          create: (context) => RegisterBloc(AuthDatasource()),
        ),
        // BlocProvider untuk LoginBloc
        BlocProvider(
          create: (context) => LoginBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => ChangePasswordBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => ForgotPasswordBloc(AuthDatasource()),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => ResetPasswordBloc(),
        ),
        // BlocProvider untuk Bloc lainnya bisa ditambahkan di sini jika diperlukan
      ],
      child: const MyApp(), // Memisahkan MaterialApp ke widget terpisah
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}