import 'package:flutter/material.dart';
import 'package:fortresstestapp/features/business_hours/domain/entities/business.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.business,
    required this.index,
  });

  final Business business;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: HSLColor.fromColor(Theme.of(context).colorScheme.secondary)
          .withLightness(0.4 + (index % 3) * 0.1)
          .toColor(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(business.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
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
