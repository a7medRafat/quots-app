import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/config/themes/app_theme.dart';
import 'package:quotes/core/dio_helper/dio_helper.dart';
import 'package:quotes/randomquotes/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/splash_screen.dart';
import 'bloc_observer.dart';
import 'injuctoin_container.dart' as di;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<RandomQuoteCubit>()..getRandomQuote(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'quotes App',
          theme: appTheme(),
          home:  const SplashScreen()
      ),
    );
  }
}


