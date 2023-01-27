import 'package:first/state/objectbox_state.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'data_source/user_data_source.dart';
import 'helper/objectbox.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // create an object for objectboxinstance
  ObjectBoxState.objectBoxInstance = await ObjectBoxInstance.init();

  runApp(
    const MyApp(),
  );
}
