import 'package:app_notifications/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'constants/app_strings.dart';
import 'constants/colors.dart';

void main() {
  AwesomeNotifications().initialize(
    '',
    [
      NotificationChannel(
        channelKey: AppStrings.BASIC_CHANNEL_KEY,
        channelName: AppStrings.BASIC_CHANNEL_NAME,
        channelDescription: AppStrings.BASIC_CHANNEL_DESCRIPTION,
        defaultColor: AppColor.secondaryColor,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
      NotificationChannel(
        channelKey: AppStrings.SCHEDULE_CHANNEL_KEY,
        channelName: AppStrings.SCHEDULE_CHANNEL_NAME,
        channelDescription: AppStrings.SCHEDULE_CHANNEL_DESCRIPTION,
        defaultColor: AppColor.secondaryColor,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        soundSource: 'resource://raw/res_notification_sound'
      ),
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MyApp.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
