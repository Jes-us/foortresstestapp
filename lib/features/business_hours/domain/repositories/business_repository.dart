import 'package:dartz/dartz.dart';
import '../entities/business.dart';

abstract class BusinessRepository {
  Future<Either<Exception, List<Business>>> getBusinesses();
}
