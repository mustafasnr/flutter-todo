import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/index/index_view.dart';
import 'package:todo/index/index_view_model.dart';
import 'package:todo/login_register/login_view.dart';
import 'package:todo/login_register/login_view_model.dart';
import 'package:todo/login_register/register_view.dart';
import 'package:todo/login_register/register_view_model.dart';
import 'package:todo/onboard/onboard_view.dart';
import 'package:todo/onboard/onboard_view_model.dart';
import 'package:todo/welcome/welcome_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => OnboardViewModel()),
            ChangeNotifierProvider(create: (context) => LoginViewModel()),
            ChangeNotifierProvider(create: (context) => RegisterViewModel()),
            ChangeNotifierProvider(create: (context) => IndexViewModel()),
          ],
          child: MaterialApp(
            initialRoute: '/index',
            routes: {
              '/': (context) => const OnboardView(),
              '/welcome': (context) => const WelcomeView(),
              '/login': (context) => const LoginView(),
              '/register': (context) => const RegisterView(),
              '/index': (context) => const IndexView(),
            },
          ),
        );
      },
    );
  }
}
