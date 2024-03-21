import 'package:audioplayers/audioplayers.dart';
import 'package:care_call/home/view/radio_service_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../config/color_constants.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.screen});

  final String screen;

  @override
  Widget build(BuildContext context) {
    print("width");
    print(MediaQuery.of(context).size.width);
    print("updatedWidth");
    print(MediaQuery.of(context).size.width * 0.33 * 2);
    var sWidth = MediaQuery.of(context).size.width;
    AudioPlayer audioPlayer = AudioPlayer();

    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) async {
      if (state.isPlay) {
        // await audioPlayer.play(AssetSource('token_audio.mp3'),
        //     mode: PlayerMode.lowLatency);
        // audioPlayer.dispose();
        print("isPlayAudio");
      }
    }, builder: (context, state) {
      return Column(
        children: [
          Container(
            child: _buildHeader(state),
          ),
          _buildBody(state)
        ],
      );
    });
  }

  _buildBody(HomeState state) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Welcome to Hospital',
                      style: TextStyle(),
                      children: [
                        TextSpan(
                          text: ' Mr. Test Name!',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorConstants.appRed),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: StaggeredGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        children: const [
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: Text("0"),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 1,
                            child: Text("1"),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: Text("2"),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: Text("3"),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 4,
                            mainAxisCellCount: 2,
                            child: Text("4"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Spacer(),
                      Icon(
                        Icons.logout,
                        size: 16,
                        color: ColorConstants.appRed,
                      ),
                      SizedBox(width: 2),
                      Text('Logout',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10)),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                      "We are here to make your stay comfortable. Raise requests from your bed."),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                      elevation: 0,
                      margin: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: ColorConstants.whiteSix, width: 1.0),
                          borderRadius: BorderRadius.circular(4.0)),
                      color: ColorConstants.whiteSix,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("UHID",
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontSize: 10)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("12345",
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10)),
                                        Expanded(flex: 5, child: SizedBox()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text("Practitioner",
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontSize: 10)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                            'Dr. Vijay Verma, Interventional Cardiologist)',
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10)),
                                        Spacer(),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text("Payer Type: ",
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontSize: 10)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Self-Pay",
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text('Status',
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontSize: 10)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Care in Progress',
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ],
                            )),
                            Flexible(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Name",
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("12345",
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10)),
                                        Expanded(flex: 5, child: SizedBox()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text("Admission No",
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('12 Feb 2024 | 12:30 PM | ',
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10)),
                                        Text('Day 37',
                                            style: TextStyle(
                                                color: ColorConstants.appRed,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10)),
                                        Spacer(),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text("Diet Preference ",
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Veg",
                                            style: TextStyle(
                                                color: ColorConstants.textBlack,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: ColorConstants.whiteSix,
                    child: Column(
                      children: [
                        RadioServiceWidget(),
                        const SizedBox(
                          height: 15,
                        ),
                        Wrap(
                          children: [
                            Container(
                              width: 60,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.appRed, width: 0.8),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              child: const Center(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 5.0, right: 5.0),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: ColorConstants.appRed,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Request Status",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                          color: ColorConstants.greyishBrown)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: ColorConstants.whiteSix,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 75,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
                              height: 4,
                              color: Colors.transparent,
                            ),
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, position) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, top: 4, bottom: 4),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text("Need Lunch Asap $position",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color:
                                                  ColorConstants.greyishBrown)),
                                    ),
                                    const Spacer(),
                                    const Flexible(
                                      child: Text("15 Feb 2024| 12:40PM",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color:
                                                  ColorConstants.greyishBrown)),
                                    ),
                                    const SizedBox(width: 20),
                                    const Flexible(
                                      child: Text("Acknowledged",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color:
                                                  ColorConstants.greyishBrown)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  _buildHeader(HomeState state) {
    return Container(
      color: ColorConstants.greyishBrown,
      child: Row(
        children: [
          Text(""),
          const Spacer(),
          const Spacer(),
          // const DropDownWidget(data: Constants.tokenType, screen: "token"),
          const SizedBox(
            width: 10,
            height: 70,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
