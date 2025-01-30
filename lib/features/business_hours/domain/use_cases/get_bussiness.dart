import 'package:dartz/dartz.dart';
import '../entities/business.dart';
import '../repositories/business_repository.dart';

class GetBusinesses {
  final BusinessRepository repository;

  GetBusinesses(this.repository);

  Future<Either<Exception, List<Business>>> call() {
    return repository.getBusinesses();
  }
}
