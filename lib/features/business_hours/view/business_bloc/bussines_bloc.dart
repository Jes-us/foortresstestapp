import 'package:bloc/bloc.dart';
import 'package:fortresstestapp/features/business_hours/domain/use_cases/get_bussiness.dart';
import 'package:fortresstestapp/features/business_hours/view/business_bloc/business_events.dart';
import 'package:fortresstestapp/features/business_hours/view/business_bloc/business_states.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  final GetBusinesses getBusinesses;

  BusinessBloc({required this.getBusinesses}) : super(BusinessInitial()) {
    on<FetchBusinesses>((event, emit) async {
      emit(BusinessesLoading());
      final either = await getBusinesses();
      either.fold(
        (failure) => emit(BusinessError("Error al cargar negocios")),
        (businesses) => emit(BusinessLoaded(businesses)),
      );
    });
  }
}
