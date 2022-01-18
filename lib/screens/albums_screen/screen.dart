import 'package:aronets_test_task_eclipse/data/models/album_model.dart';
import 'package:aronets_test_task_eclipse/styles/app_text_style.dart';
import 'package:aronets_test_task_eclipse/widgets/large_image.dart';
import 'package:aronets_test_task_eclipse/widgets/main_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({
    Key? key,
    required this.albums,
  }) : super(key: key);

  final List<AlbumsModel>? albums;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Альбомы'),
      body: albums != null
          ? ListView.builder(
              itemCount: albums!.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    albums![index].photos != null
                        ? CarouselSlider(
                            options: CarouselOptions(
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                            ),
                            items: albums![index]
                                .photos!
                                .map(
                                  (item) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LargeImage(
                                            image: item,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(item),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        : const SizedBox(
                            height: 100,
                            child: Center(
                              child: Text('Нет альбомов'),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Text(
                        albums![index].description!,
                        style: AppTextStyle.textStyle14w300,
                      ),
                    ),
                  ],
                );
              },
            )
          : const Center(
              child: Text('Нет альбомов'),
            ),
    );
  }
}
