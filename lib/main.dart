import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/helpers/get_it_singleton_helper.dart';
import 'Features/Home/domain/repos/home_service.dart';
import 'Features/Home/presentation/manager/cubits/product_cubit/product_cubit.dart';
import 'Features/Splash/presentation/views/splash_view.dart';
import 'core/functions/on_generate_routes.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  await Hive.openBox('Seen');
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(homeService: getIt<HomeService>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
        onGenerateRoute: onGenerateRoutes,
        initialRoute:  SplashView.routeName,
      ),
    );
  }
}
