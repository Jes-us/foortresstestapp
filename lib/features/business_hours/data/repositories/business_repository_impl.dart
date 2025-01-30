import 'package:dartz/dartz.dart';
import '../../domain/repositories/business_repository.dart';
import '../data_sources/business_service.dart';
import '../../data/models/business_model.dart';
import '../../domain/entities/business.dart';

class BusinessRepositoryImpl implements BusinessRepository {
  final BusinessService getBusiness;

  BusinessRepositoryImpl(this.getBusiness);

  @override
  Future<Either<Exception, List<Business>>> getBusinesses() async {
    try {
      List<BusinessModel> businessModels = await getBusiness.listBusiness();

      final List<Business> businessEntities =
          businessModels.map((b) => b).toList();

      return Right(businessEntities);
    } catch (e) {
      return Left(Exception('Failed to load businesses'));
    }
  }
}
