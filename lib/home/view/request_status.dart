import 'package:flutter/material.dart';

import '../../config/color_constants.dart';

class RequestStatus extends StatelessWidget {
  const RequestStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.whiteSix,
      child: Column(
        children: [
          SizedBox(
            height: 75,
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 2,
                color: Colors.transparent,
              ),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, position) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10, top: 2, bottom: 2),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text("Need Lunch Asap $position",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: ColorConstants.greyishBrown)),
                      ),
                      const Spacer(),
                      const Flexible(
                        child: Text("15 Feb 2024 | 12:40PM",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: ColorConstants.greyishBrown)),
                      ),
                      const SizedBox(width: 20),
                      checkStatusColor(position),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget checkStatusColor(int position) {
    if (position == 1) {
      return const Flexible(
        child: Text("InProgress",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: ColorConstants.bottomHeader)),
      );
    } else if (position == 3) {
      return const Flexible(
        child: Text("Completed",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: ColorConstants.statusGreen)),
      );
    } else {
      return const Flexible(
        child: Text("Acknowledged",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: ColorConstants.greyishBrown)),
      );
    }
  }
}
