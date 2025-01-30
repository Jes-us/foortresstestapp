import 'package:equatable/equatable.dart';
import 'hours.dart';

class Business extends Equatable {
  final int id;
  final String name;
  final Map<String, List<Hours>> hours;

  const Business({
    required this.id,
    required this.name,
    required this.hours,
  });

  @override
  List<Object?> get props => [id, name, hours];
}
