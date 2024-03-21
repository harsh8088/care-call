import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../repository/request_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RequestRepository repository;
  int page = 1;
  bool isFetching = false;

  HomeBloc({
    required this.repository,
  }) : super(const HomeState()) {
    on<HomeFetchEvent>(_onTokenFetchEvent);
  }

  void _onTokenFetchEvent(HomeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
      ));

      // final response = await repository.getDisplayServices(
      //     deviceId: Constants.deviceID, deviceModel: Constants.deviceModel);

      final String strResponse =
          await rootBundle.loadString('assets/counter_list.json');
      final response = await json.decode(strResponse);

      // emit(state.copyWith(
      //     status: FormzStatus.pure,
      //     data: [tokenResponse],
      //     tokens: finalServices.toList(),
      //     blinkTokens: blinkTokens,
      //     isPlay: isPlay));
    } catch (_) {
      print(_.toString());
    }
  }
}
