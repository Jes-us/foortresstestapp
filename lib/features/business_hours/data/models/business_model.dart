import '../../domain/entities/business.dart';
import 'hours_model.dart';

class BusinessModel extends Business {
  const BusinessModel({
    required int id,
    required String name,
    required Map<String, List<HoursModel>> hours,
  }) : super(id: id, name: name, hours: hours);

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      id: json['id'],
      name: json['name'],
      hours: (json['hours'] as Map<String, dynamic>).map(
        (day, periods) => MapEntry(
          day,
          (periods as List).map((p) => HoursModel.fromJson(p)).toList(),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "hours": hours.map(
        (day, periods) => MapEntry(
          day,
          periods.map((p) => (p as HoursModel).toJson()).toList(),
        ),
      ),
    };
  }
}
