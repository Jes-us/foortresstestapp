import 'package:flutter_test/flutter_test.dart';
import 'package:fortresstestapp/features/business_hours/view/business_bloc/bussines_bloc.dart'
    as business_bloc;

void main() {
  group('getTodayDay', () {
    test('Debe retornar el día correcto de la semana', () {
      expect(business_bloc.BusinessBloc.getTodayDay(1), 'Monday');
      expect(business_bloc.BusinessBloc.getTodayDay(2), 'Tuesday');
      expect(business_bloc.BusinessBloc.getTodayDay(3), 'Wednesday');
      expect(business_bloc.BusinessBloc.getTodayDay(4), 'Thursday');
      expect(business_bloc.BusinessBloc.getTodayDay(5), 'Friday');
      expect(business_bloc.BusinessBloc.getTodayDay(6), 'Saturday');
      expect(business_bloc.BusinessBloc.getTodayDay(7), 'Sunday');
    });

    test('Debe retornar Sunday si el número no está en el rango', () {
      expect(business_bloc.BusinessBloc.getTodayDay(0), 'Not valid day');
      expect(business_bloc.BusinessBloc.getTodayDay(8), 'Not valid day');
    });
  });

  group('isOpen', () {
    test('Debe retornar false si open o close es NoSchedule', () {
      expect(
          business_bloc.BusinessBloc.isOpen('NoSchedule', 'NoSchedule'), false);
      expect(
          business_bloc.BusinessBloc.isOpen('NoSchedule', '10:00 AM'), false);
      expect(
          business_bloc.BusinessBloc.isOpen('10:00 AM', 'NoSchedule'), false);
    });

    test('Debe retornar true si la hora actual está entre open y close', () {
      expect(business_bloc.BusinessBloc.isOpen('10:00 AM', '6:00 PM'), true);
    });

    test('Debe retornar false si la hora actual no está entre open y close',
        () {
      expect(business_bloc.BusinessBloc.isOpen('2:00 AM', '6:00 AM'), false);
    });
  });
}
