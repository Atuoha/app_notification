import 'package:app_notifications/pages/stats_page.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../components/customElevatedButton.dart';
import '../components/custom_alert_dialog.dart';
import '../components/custom_rich_text.dart';
import '../constants/app_strings.dart';
import '../constants/colors.dart';
import '../utilities/create_uid.dart';
import '../utilities/notification_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedNotificationDay = '';
  int selectedDayOfTheWeek = 0;
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isTimeSelected = false;
  final uid = const Uuid();
  late NotificationUtil notificationUtil;

  final List<String> notificationDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thur',
    'Fri',
    'Sat',
    'Sun'
  ];

  void createBasicNotification() {
    notificationUtil.createBasicNotification(
      id: createUniqueId(),
      channelKey: AppStrings.BASIC_CHANNEL_KEY,
      title:
          '${Emojis.clothing_backpack + Emojis.transport_air_airplane} Network Call',
      body:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur',
      bigPicture: 'asset://assets/imgs/eco_large.png',
    );
  }

  void triggerCancelNotification() {
    // Todo
  }

  void triggerScheduleNotification() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Show Notification Every'),
        content: Wrap(
          spacing: 3.0,
          runSpacing: 8.0,
          children: notificationDays
              .asMap()
              .entries
              .map(
                (day) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondaryColor),
                  onPressed: () {
                    int index = day.key;
                    setState(() {
                      selectedNotificationDay = day.value;
                      selectedDayOfTheWeek = index + 1;
                    });
                    pickTime();
                  },
                  child: Text(
                    day.value,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  // create schedule notification
  void createScheduleNotification() {
    notificationUtil.createScheduledNotification(
      id: createUniqueId(),
      channelKey: AppStrings.SCHEDULE_CHANNEL_KEY,
      title: '${Emojis.time_alarm_clock} Check your rocket!',
      body:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur',
      layout: NotificationLayout.Default,
      notificationCalendar: NotificationCalendar(
        hour: selectedTime.hour,
        minute: selectedTime.minute,
        weekday: selectedDayOfTheWeek,
      ),
    );
  }

  // time picker
  Future<TimeOfDay?> pickTime() async {
    await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then(
      (time) {
        setState(() {
          selectedTime = time!;
          isTimeSelected = true;
        });
        createScheduleNotification();
        Navigator.of(context).pop();
      },
    );
    return null;
  }

  // request permission
  void requestPermission() {
    notificationUtil.requestPermissionToSendNotifications(context: context);
  }

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((_) {
      return customAlertDialog(
        title: 'Allow notifications',
        content: 'Rocket App needs access to notifications',
        context: context,
        action: requestPermission,
        button1Title: 'Allow',
        button2Title: 'Don\'t Allow',
      );
    });

    notificationUtil = NotificationUtil(
      awesomeNotifications: AwesomeNotifications(),
    );

    AwesomeNotifications().setListeners(
      onNotificationCreatedMethod: (notification) async =>
          NotificationUtil.onNotificationCreatedMethod(notification, context),
      onActionReceivedMethod: (ReceivedAction receivedAction) =>
          NotificationUtil.onActionReceivedMethod(receivedAction),
      onDismissActionReceivedMethod: (ReceivedAction receivedAction) =>
          NotificationUtil.onDismissActionReceivedMethod(receivedAction),
      onNotificationDisplayedMethod: (ReceivedNotification
              receivedNotification) =>
          NotificationUtil.onNotificationDisplayedMethod(receivedNotification),
    );

    super.initState();
  }

  @override
  void dispose() {
    AwesomeNotifications().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Wrap(
          spacing: 8,
          children: [
            Icon(
              CupertinoIcons.rocket,
              color: Colors.white,
            ),
            Text(
              'Rockets',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const StatsPage(),
              ),
            ),
            icon: const Icon(
              CupertinoIcons.chart_bar_square,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isTimeSelected) ...[
            CustomRichText(
              title: 'Selected Day: ',
              content: selectedNotificationDay,
            ),
            const SizedBox(height: 10),
            CustomRichText(
              title: 'Selected Time: ',
              content: selectedTime.format(context),
            ),
            const SizedBox(height: 10),
          ],
          Image.asset('assets/imgs/rocket.png'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomElevatedButton(
                function: createBasicNotification,
                title: 'Network',
                icon: CupertinoIcons.news,
              ),
              CustomElevatedButton(
                function: triggerScheduleNotification,
                title: 'Eco Tickets',
                icon: CupertinoIcons.tickets,
              ),
              CustomElevatedButton(
                function: triggerCancelNotification,
                title: 'Cancel',
                icon: CupertinoIcons.xmark_octagon,
              ),
            ],
          )
        ],
      ),
    );
  }
}
