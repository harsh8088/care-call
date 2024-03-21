import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/color_constants.dart';
import '../bloc/otp_bloc.dart';
import '../bloc/otp_event.dart';
import '../bloc/otp_state.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpBloc, OtpState>(listener: (context, state) async {
      if (state.status == OtpStatus.isFalse) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/home", (Route route) => false);

      }
      if (state.status == OtpStatus.isTrue) {
        Timer(const Duration(seconds: 6), () {
          BlocProvider.of<OtpBloc>(context).add(const OtpFetchEvent());
        });
      }
    }, builder: (context, state) {
      // if (state.status == OtpStatus.loading) {
      //   return const CircularProgressIndicator(
      //     color: ColorConstants.appRed,
      //   );
      // }
      return Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                size: 65,
                Icons.home_work_outlined,
                color: ColorConstants.appRed,
              )),
          const Spacer(),
          state.status == OtpStatus.loading
              ? const CircularProgressIndicator(
                  color: ColorConstants.appRed,
                )
              : Text(state.otp,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: ColorConstants.brownishGrey)),
          const SizedBox(
            height: 6,
          ),
          const Text(
              "Login into dashboard. From “Devices” option add this code to pair the device.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                  color: ColorConstants.brownishGrey)),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              size: 40,
              Icons.home_work_outlined,
              color: ColorConstants.appRed,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    });
  }
}
