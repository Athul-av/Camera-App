import 'package:camera_project/db/model/db_model.dart';
import 'package:camera_project/screens/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(GallaryModelAdapter().typeId)) {
    Hive.registerAdapter(GallaryModelAdapter());
  }
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      home:const CameraScreen(),
    );
  }
}