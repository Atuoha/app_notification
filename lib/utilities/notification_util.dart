import 'dart:io';
import 'package:app_notifications/utilities/create_uid.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../pages/stats_page.dart';

class NotificationUtil {
  final AwesomeNotifications awesomeNotifications;

  NotificationUtil({required this.awesomeNotifications});

  Future<void> createNetworkNotification() async {
    awesomeNotifications.createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title:
            '${Emojis.clothing_backpack + Emojis.transport_air_airplane} Network Call',
        body:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur',
        bigPicture: 'asset://assets/imgs/eco_large.png',
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

  // requestPermissionToSendNotifications
  void requestPermissionToSendNotifications({required BuildContext context}) {
    AwesomeNotifications().requestPermissionToSendNotifications().then((value) {
      Navigator.of(context).pop();
    });
  }

  // listener actions
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Notification created ${receivedNotification.channelKey}'),
      ),
    );
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here

    if (receivedAction.channelKey == 'basic_channel' && Platform.isIOS) {
      AwesomeNotifications().getGlobalBadgeCounter().then((value) {
        AwesomeNotifications().setGlobalBadgeCounter(value - 1);
      });
    }

    MyApp.navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const StatsPage(),
        ),
        (route) => route.isFirst);
  }
}
