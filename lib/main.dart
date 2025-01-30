import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortresstestapp/core/theme.dart';
import 'package:fortresstestapp/dependency_injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortresstestapp/features/business_hours/view/business_bloc/business_events.dart';
import 'package:fortresstestapp/features/business_hours/view/business_bloc/bussines_bloc.dart';
import 'package:fortresstestapp/features/business_hours/view/screens/bussines_screen.dart';

void main() async {
  di.setup();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Solo permite modo vertical
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(BlocProvider(
      create: (_) => di.sl<BusinessBloc>()
        ..add(FetchBusinesses()), // Llama al evento al inicio

      child: const MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Business Hours App',
      theme: darkTheme,
      home: const MyHomePage(title: 'Bussines Hours App'),
    );
  }
}
