import 'package:camera_project/db/model/db_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<GalleryModel>> galleryImageNotifier = ValueNotifier([]);
Future<void> addImage(GalleryModel value) async {
  final galaryDB = await Hive.openBox<GalleryModel>('galary_db');
  final id = await galaryDB.add(value);
  value.id = id;
  galleryImageNotifier.value.add(value);
  await galaryDB.put(id, value);
  galleryImageNotifier.notifyListeners();
  getAllImage();
}

Future<void> getAllImage() async {
  final galaryDB = await Hive.openBox<GalleryModel>('galary_db');
  galleryImageNotifier.value.clear();
  galleryImageNotifier.value.addAll(galaryDB.values);
  galleryImageNotifier.notifyListeners();
}

// Future<void> clearAllImage() async {
//   final galaryDB = await Hive.openBox<GalleryModel>('galary_db');
//   galleryImageNotifier.value.clear();
//   galaryDB.clear();
// }

Future<void> deleteAllImage() async {
  final galaryDB = await Hive.openBox<GalleryModel>('galary_db');
  galleryImageNotifier.value.clear();
  galaryDB.clear();
  galleryImageNotifier.notifyListeners();
}