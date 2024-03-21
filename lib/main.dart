import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/constants.dart';
import 'home/home.dart';
import 'otp/otp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    //clearing saved tokens
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    if (kIsWeb) {
      // web-specific setup
      var webInfo = await DeviceInfoPlugin().webBrowserInfo;
      // print('ios_id: ${webInfo.identifierForVendor}');
      // print('ios_model: ${webInfo.model}');
      // print('ios_name: ${webInfo.name}');
      // print('ios_device_version: ${webInfo.systemVersion}');
      // Constants.deviceID = '${webInfo.identifierForVendor}';
      // Constants.deviceModel = '${webInfo.model}_${webInfo.systemVersion}';
      print("webinfo");
      print(webInfo.toString());
      Constants.deviceID =
          '${webInfo.vendor}_${webInfo.userAgent}_${webInfo.hardwareConcurrency.toString()}';
      Constants.deviceModel = '${webInfo.vendor}_${webInfo.userAgent}';
      print('deviceId:${Constants.deviceID}');
    } else if (Platform.isAndroid) {
      // Android-specific setup
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.isPhysicalDevice) {
        print('android_id: ${androidInfo.id}');
        print(
            'android_device_name_version: ${androidInfo.model}_${androidInfo.version.release}');
        Constants.deviceID = androidInfo.id;
        Constants.deviceModel =
            '${androidInfo.model}_${androidInfo.version.release}';
      } else {
        print('on Emulator');
      }
    }
  } catch (e) {
    print(e.toString());
  }
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'CareCall',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Home Page'),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterTV',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/otp',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/otp': (context) => const OtpScreen(),
      },
    );
  }
}
