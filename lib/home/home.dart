import 'package:care_call/home/view/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/request_repository.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => HomeBloc(
                  repository: RequestRepository(),
                )..add(const HomeFetchEvent()),
            child: const SafeArea(
              child: HomeBody(
                screen: 'Home',
              ),
            )));
  }
}
