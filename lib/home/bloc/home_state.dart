import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class HomeState extends Equatable {
  const HomeState(
      {this.status = FormzStatus.valid,
      this.message = "",
      this.isPlay = false});

  final FormzStatus status;
  final String message;

  final bool isPlay;

  HomeState copyWith(
      {FormzStatus? status,
      String? message,
      List<int>? blinkTokens,
      bool? isPlay}) {
    return HomeState(
        status: status ?? this.status,
        message: message ?? this.message,
        isPlay: isPlay ?? this.isPlay);
  }

  @override
  List<Object> get props => [status, message, isPlay];
}
