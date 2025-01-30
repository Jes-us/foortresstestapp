import 'package:fortresstestapp/features/business_hours/domain/entities/business.dart';

abstract class BusinessState {}

class BusinessInitial extends BusinessState {}
// Estado inicial

class BusinessesLoading extends BusinessState {}
// Estado de carga

class BusinessLoaded extends BusinessState {
  final List<Business> businesses;
  BusinessLoaded(this.businesses);
}

class BusinessError extends BusinessState {
  final String message;
  BusinessError(this.message);
} // Estado de error
