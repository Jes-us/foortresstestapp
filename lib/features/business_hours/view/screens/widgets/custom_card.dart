import 'package:flutter/material.dart';
import 'package:fortresstestapp/features/business_hours/domain/entities/business.dart';
import 'package:fortresstestapp/features/business_hours/view/business_bloc/bussines_bloc.dart';

class CustomCard extends StatefulWidget {
  CustomCard({
    super.key,
    required this.business,
    required this.index,
    required this.toDay,
  });

  final Business business;
  final int index;
  final String toDay;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  late String isOpen;

  @override
  Widget build(BuildContext context) {
    if (BusinessBloc.isOpen(
      widget.business.hours[widget.toDay]?.first.open.toString() ??
          'NoSchedule',
      widget.business.hours[widget.toDay]?.first.close.toString() ??
          'NoSchedule',
    )) {
      isOpen = 'Open';
    } else {
      isOpen = 'Closed';
    }

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: HSLColor.fromColor(Theme.of(context).colorScheme.secondary)
          .withLightness(0.4 + (widget.index % 3) * 0.1)
          .toColor(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.business.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(isOpen,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
              '${widget.business.hours[widget.toDay]?.first.open ?? '--:--'} - ${widget.business.hours[widget.toDay]?.first.close ?? '--:--'} ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Icon(
            Icons.access_time,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Text("Tap to check hours",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
