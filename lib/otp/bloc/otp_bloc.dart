import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants.dart';
import '../../repository/request_repository.dart';
import '../model/otp_response.dart';
import 'otp_event.dart';
import 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final RequestRepository repository;
  int page = 1;
  bool isFetching = false;

  OtpBloc({
    required this.repository,
  }) : super(const OtpState()) {
    on<OtpFetchEvent>(_onOtpFetchEvent);
  }

  void _onOtpFetchEvent(OtpEvent event, Emitter<OtpState> emit) async {
    try {
      emit(state.copyWith(
        status: OtpStatus.loading,
      ));
      Constants.deviceID = "6b84c1654ddf8b53";
      final response = await repository.getOtp(deviceId: Constants.deviceID);
      print(response);
      final otpResponse = OtpResponse.fromJson(response);
      if (otpResponse.status == true) {
        emit(state.copyWith(
          status: OtpStatus.isTrue,
          otp: otpResponse.otp.toString(),
        ));
      } else {
        emit(state.copyWith(
          status: OtpStatus.isFalse,
          otp: otpResponse.otp.toString(),
        ));
      }
    } catch (_) {
      print(_.toString());
      emit(state.copyWith(
        status: OtpStatus.pure,
      ));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
