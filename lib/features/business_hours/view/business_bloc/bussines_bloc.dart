import 'package:intl/intl.dart';
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

  static String getTodayDay(int day) {
    String today = day == 1
        ? 'Monday'
        : day == 2
            ? 'Tuesday'
            : day == 3
                ? 'Wednesday'
                : day == 4
                    ? 'Thursday'
                    : day == 5
                        ? 'Friday'
                        : day == 6
                            ? 'Saturday'
                            : day == 7
                                ? 'Sunday'
                                : 'Not valid day';
    return today;
  }

  static bool isOpen(String open, String close) {
    if (open == 'NoSchedule' || close == 'NoSchedule') {
      return false;
    } else {
      DateTime now = DateTime.now();
      DateFormat format = DateFormat("h:mm a");

      String nowFormatted = DateFormat("h:mm a").format(now);
      DateTime openTime = format.parse(open);
      DateTime closeTime = format.parse(close);
      DateTime nowTime = format.parse(nowFormatted);

      if (nowTime.isAfter(openTime) && nowTime.isBefore(closeTime)) {
        return true;
      } else {
        return false;
      }
    }
  }
}
