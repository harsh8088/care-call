import 'package:care_call/otp/view/otp_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/request_repository.dart';
import 'bloc/otp_bloc.dart';
import 'bloc/otp_event.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => OtpBloc(
                  repository: RequestRepository(),
                )..add(const OtpFetchEvent()),
            child: const Center(
              child: OtpBody(),
            )));
  }
}
