import 'dart:io';

import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String path;
  const ImageCard({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(
              File(
                path,
              ),
            ),
          ),
        ),
      ),
    );
  }
}