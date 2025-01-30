import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:fortresstestapp/features/business_hours/data/data_sources/business_service.dart';
import 'package:fortresstestapp/features/business_hours/domain/repositories/business_repository.dart';
import 'package:fortresstestapp/features/business_hours/domain/use_cases/get_bussiness.dart';
import 'package:fortresstestapp/features/business_hours/data/repositories/business_repository_impl.dart';

final sl = GetIt.instance;

void setup() async {
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<BusinessService>(() => BusinessService(sl()));

  sl.registerLazySingleton<BusinessRepository>(
      () => BusinessRepositoryImpl(sl()));

  sl.registerLazySingleton<GetBusinesses>(() => GetBusinesses(sl()));
}
