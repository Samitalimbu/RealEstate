import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:first/state/objectbox_state.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'helper/objectbox.dart';

void main() async {
  AwesomeNotifications().initialize(
    'resource://drawable/launcher',
    [
      NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notification',
          channelDescription: 'Notification channel for login',
          defaultColor: Colors.red,
          importance: NotificationImportance.Max,
          ledColor: Colors.white,
          channelShowBadge: true),
    ],
  );
  WidgetsFlutterBinding.ensureInitialized();
  // create an object for objectboxinstance
  ObjectBoxState.objectBoxInstance = await ObjectBoxInstance.init();

  runApp(
    const MyApp(),
  );
}
