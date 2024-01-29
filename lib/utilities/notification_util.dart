import 'package:app_notifications/utilities/create_uid.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:uuid/uuid.dart';

class NotificationUtil {
  final AwesomeNotifications awesomeNotifications;

  NotificationUtil({required this.awesomeNotifications});

  Future<void> createNetworkNotification() async{
    awesomeNotifications.createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title: '${Emojis.clothing_backpack + Emojis.transport_air_airplane} Network Call',
        body: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur',
        bigPicture: 'asset://assets/imgs/network.png',
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }
}
