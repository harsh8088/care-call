import 'package:care_call/home/bloc/home_bloc.dart';
import 'package:care_call/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/color_constants.dart';

class RequestTypeWidget extends StatefulWidget {
  const RequestTypeWidget({super.key});

  @override
  RequestTypeWidgetState createState() => RequestTypeWidgetState();
}

class RequestTypeWidgetState extends State<RequestTypeWidget> {
  int? _selectedIndex = 0;
  List<String> labelList = [
    "HOUSEKEEPING",
    "FOOD AND BEVERAGE",
    "ENGINEERING",
    "IT"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: labelList.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (_selectedIndex == index) {
            return Container(
              height: 30,
              decoration: BoxDecoration(
                  color: ColorConstants.appRed,
                  border: Border.all(color: ColorConstants.appRed, width: 1.5),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Text(
                    labelList[index],
                    style: const TextStyle(
                        color: ColorConstants.whiteTwo,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            );
          } else {
            return InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    color: null,
                    border:
                        Border.all(color: ColorConstants.appRed, width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Text(
                      labelList[index],
                      style: const TextStyle(
                          color: ColorConstants.appRed,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
