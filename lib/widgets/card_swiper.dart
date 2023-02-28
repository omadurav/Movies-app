import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      width: double.infinity,
      height: size.height * 0.5,
      child: movies.length > 2
          ? Swiper(
              itemCount: movies.length,
              itemWidth: size.width * 0.7,
              itemHeight: size.height * 0.5,
              layout: SwiperLayout.STACK,
              itemBuilder: (_, int index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'details',
                      arguments: 'movie-db'),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage('${movies[index].fullPosterImg}'),
                    ),
                  ),
                );
              },
            )
          : SizedBox(
              height: size.height * 0.5,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
