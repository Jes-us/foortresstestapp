import 'package:equatable/equatable.dart';

class Hours extends Equatable {
  final String open;
  final String close;

  const Hours({
    required this.open,
    required this.close,
  });

  @override
  List<Object?> get props => [open, close];
}
