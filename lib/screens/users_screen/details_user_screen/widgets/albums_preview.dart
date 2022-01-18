import 'package:aronets_test_task_eclipse/data/models/album_model.dart';
import 'package:aronets_test_task_eclipse/screens/albums_screen/screen.dart';
import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:aronets_test_task_eclipse/styles/app_text_style.dart';
import 'package:aronets_test_task_eclipse/widgets/big_image.dart';
import 'package:flutter/material.dart';

class AlbumsPreview extends StatelessWidget {
  const AlbumsPreview({
    Key? key,
    required this.albumList,
  }) : super(key: key);

  final List<AlbumsModel> albumList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Альбомы',
              style: AppTextStyle.textStyle21w500,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlbumsScreen(
                      albums: albumList,
                    ),
                  ),
                );
              },
              child: const Text('Смотреть все'),
              style: TextButton.styleFrom(
                primary: AppColors.red,
                padding: const EdgeInsets.only(right: 20),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AlbumsScreen(
                  albums: albumList,
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                ),
                height: 200,
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  color: AppColors.ultraLightGray,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                height: 200,
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 60,
                  child: BigImage(image: albumList.first.photos!.first),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
