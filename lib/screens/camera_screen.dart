import 'package:camera_project/db/functions/db_functions.dart';
import 'package:camera_project/db/model/db_model.dart';
import 'package:camera_project/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    getAllImage();
    super.initState();
  }

  late String _imageData;
  late int length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 100, 132),
        centerTitle: true,
        title: const Text(
          'Image Gallery',
        ),
        actions: [
          IconButton(
            onPressed: () {
              delete();
            },
            icon: const Icon(
              Icons.delete_rounded,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color.fromARGB(255, 31, 100, 132), 
        onPressed: () {
          getImage();
        },
        child: const Icon(
          Icons.camera_alt,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: galleryImageNotifier,
        builder: (
          BuildContext context,
          List<GalleryModel> galleryList,
          Widget? child,
        ) {
          length = galleryList.length;
          return (length == 0)
              ? const Center(
                  child: Text(
                    'No Photos ',
                  ),
                )
              : GridView.builder(
                  itemCount: galleryList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,  
                    crossAxisSpacing: 1,  
                    mainAxisSpacing: 1, 
                  ),
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    final data = galleryList[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: ImageCard(
                        path: data.image,
                      ),
                    );
                  },  );
        },
      ),
    );
  }
  Future<void> getImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (image == null) {
      return;
    }
    _imageData = image.path;
    final picture = GalleryModel(
      image: _imageData,
    );
    addImage(picture);
  }
  Future<void> delete() async {
    deleteAllImage();
  }
}