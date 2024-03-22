import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class TokenItem extends StatefulWidget {
  const TokenItem({super.key});

  @override
  State<TokenItem> createState() => _TokenItemState();
}

class _TokenItemState extends State<TokenItem>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();

  Future<void> startScrolling() async {
    await Future.delayed(const Duration(seconds: 2));
    scrollController.jumpTo(scrollController.position.minScrollExtent);
    await Future.delayed(const Duration(seconds: 2));
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // Perform your task
    } else {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 10), curve: Curves.linear);
    }
  }

  Future<void> restartScrolling() async {
    await Future.delayed(const Duration(seconds: 2));
    scrollController.jumpTo(scrollController.position.minScrollExtent);
    await Future.delayed(const Duration(seconds: 2));
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // Perform your task
    }
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 10), curve: Curves.linear);
  }

  @override
  void initState() {
    startScrolling();
    // If you want infinite scrolling use the following code
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // Scroll has reached the end, reset the position to the beginning.
        startScrolling();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Expanded(
              child: Container(),
            ));
  }
}
