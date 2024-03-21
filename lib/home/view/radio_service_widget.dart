import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/color_constants.dart';

class RadioServiceWidget extends StatefulWidget {
  const RadioServiceWidget();

  @override
  RadioServiceWidgetState createState() => RadioServiceWidgetState();
}

enum Reason { clean_the_room, send_extra_blanket, call_the_room, others }

class RadioServiceWidgetState extends State<RadioServiceWidget> {
  final _controller = TextEditingController();
  Reason? _reason = Reason.clean_the_room;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final taskMapping =
    //     context
    //         .read<ProgressBloc>()
    //         .state
    //         .carePlanData[0].taskMapping;
    return Container(
      // constraints: BoxConstraints(minHeight: 40),
      // color: Colors.amberAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Radio<Reason>(
                activeColor: ColorConstants.appRed,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: Reason.clean_the_room,
                groupValue: _reason,
                onChanged: (Reason? value) {
                  setState(() {
                    _reason = value;
                    _controller.clear();
                  });
                },
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: const Text('Please clean the room',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: ColorConstants.greyishBrown)),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Radio<Reason>(
                activeColor: ColorConstants.appRed,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: Reason.send_extra_blanket,
                groupValue: _reason,
                onChanged: (Reason? value) {
                  setState(() {
                    _reason = value;
                    _controller.clear();
                  });
                },
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: const Text('Please send an extra Blanket',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: ColorConstants.greyishBrown)),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Radio<Reason>(
                activeColor: ColorConstants.appRed,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: Reason.call_the_room,
                groupValue: _reason,
                onChanged: (Reason? value) {
                  setState(() {
                    _reason = value;
                    _controller.clear();
                  });
                },
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: const Text('Please call the room',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: ColorConstants.greyishBrown)),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Radio<Reason>(
                activeColor: ColorConstants.appRed,
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: Reason.others,
                groupValue: _reason,
                onChanged: (Reason? value) {
                  setState(() {
                    _reason = value;
                    _controller.clear();
                  });
                },
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: const Text('Others',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: ColorConstants.greyishBrown)),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          _reason == Reason.others
              ? Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          width: 1,
                          color: ColorConstants.pinkishGrey,
                          style: BorderStyle.solid)),
                  child: TextField(
                    minLines: 4,
                    maxLines: 4,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        hintText: 'Type Here',
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none),
                    // controller: _internalController,
                    onChanged: (value) {
                      //print('ReasonForChange: $value');
                    },
                  ),
                )
              : SizedBox(),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
