import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortresstestapp/features/business_hours/view/business_bloc/business_states.dart';
import 'package:fortresstestapp/features/business_hours/view/business_bloc/bussines_bloc.dart';
import 'package:fortresstestapp/features/business_hours/view/screens/widgets/custom_card.dart';

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
        backgroundColor: Theme.of(context)
            .appBarTheme
            .backgroundColor, // Color de fondo del appbar
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
            String toDay = BusinessBloc.getTodayDay(state.toDay);

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.businesses.length,
              itemBuilder: (context, index) {
                final business = state.businesses[index];
                return GestureDetector(
                  onTap: () {},
                  child: CustomCard(
                    business: business,
                    index: index,
                    toDay: toDay,
                    //toDay: 'Monday',
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
