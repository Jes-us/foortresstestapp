import 'package:flutter/material.dart';
import 'package:fortresstestapp/dependency_injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortresstestapp/features/business_hours/view/business_bloc/business_events.dart';
import 'package:fortresstestapp/features/business_hours/view/business_bloc/business_states.dart';
import 'package:fortresstestapp/features/business_hours/view/business_bloc/bussines_bloc.dart';

void main() async {
  di.setup();
  runApp(BlocProvider(
    create: (_) => di.sl<BusinessBloc>()
      ..add(FetchBusinesses()), // Llama al evento al inicio

    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<BusinessBloc, BusinessState>(
        builder: (context, state) {
          if (state is BusinessInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BusinessesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BusinessLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.businesses.length,
              itemBuilder: (context, index) {
                final business = state.businesses[index];
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(business.name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(business.id.toString()),
                        Text("Tap para ver horarios"),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is BusinessError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
