import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/common/utils/constants.dart';
import 'package:riverpod_todo/features/auth/pages/login_page.dart';
import 'package:riverpod_todo/features/onboarding/pages/onboarding.dart';
import 'package:riverpod_todo/features/onboarding/pages/test_page.dart';
import 'package:riverpod_todo/features/todo/pages/homepage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
    useInheritedMediaQuery: true,
    designSize: const Size(375, 825),
    minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Trymore',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppConst.kBkDark,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          themeMode: ThemeMode.dark,
          home: const HomePage(),
        );
      }
    );
  }
}
    