import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class LargeImage extends StatelessWidget {
  const LargeImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: PhotoView(
        imageProvider: NetworkImage(image),
      ),
    );
  }
}
