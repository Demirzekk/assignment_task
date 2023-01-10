import 'dart:io';

import 'package:assignment_task/utility/extensions/general_extensions.dart';

import '../../network/service.dart';
import 'appointment_model.dart';

abstract class IAppointmentModelViewModel {
  Future<List<AppointmentModel?>> fetchAppointments();
}

class AppointmentModelViewModel extends DioRequest
    implements IAppointmentModelViewModel {
  @override
  Future<List<AppointmentModel?>> fetchAppointments() async {
    List<AppointmentModel?> list = [];
    final response = await get().onError(
      (error, stackTrace) {
        "Http status errors".log();

        throw error.toString();
      },
    );

    if (response.statusCode != HttpStatus.ok) {
      "Http status error".log();
    }
    if (response.data != null) {
      response.data.forEach((v) {
        list.add(AppointmentModel.fromJson(v));
      });
    }
    return list;
  }
}
