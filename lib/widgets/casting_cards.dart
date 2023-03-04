import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const _CardActor();
        },
      ),
    );
  }
}

class _CardActor extends StatelessWidget {
  const _CardActor();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              image: NetworkImage('https://via.placeholder.com/200x300'),
              placeholder: AssetImage('assets/no-image.jpg'),
              fit: BoxFit.cover,
              height: 160,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text('move.actor')
      ],
    );
  }
}
