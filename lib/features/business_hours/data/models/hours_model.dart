import '../../domain/entities/hours.dart';

class HoursModel extends Hours {
  const HoursModel({required String open, required String close})
      : super(open: open, close: close);

  factory HoursModel.fromJson(Map<String, dynamic> json) {
    return HoursModel(
      open: json['open'],
      close: json['close'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "open": open,
      "close": close,
    };
  }
}
