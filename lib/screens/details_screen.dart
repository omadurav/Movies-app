import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(slivers: [
        const _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            const _PosterAndTitle(),
            const _MovieDescription(),
            const CastingCards(),
          ]),
        )
      ]),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage('https://via.placeholder.com/200x300'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'movie.title',
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  'movie.original-title',
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_border_outlined),
                    const SizedBox(width: 10),
                    Text(
                      'movie.vote',
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class _MovieDescription extends StatelessWidget {
  const _MovieDescription();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: const Text(
        'Velit laboris quis id dolor incididunt dolore id magna. Aliquip esse id non sint eu officia quis quis aliqua mollit in id. Reprehenderit excepteur officia magna exercitation anim. Dolor et eu veniam laboris reprehenderit ullamco qui exercitation tempor. Velit laboris quis id dolor incididunt dolore id magna. Aliquip esse id non sint eu officia quis quis aliqua mollit in id. Reprehenderit excepteur officia magna exercitation anim. Dolor et eu veniam laboris reprehenderit ullamco qui exercitation tempor.',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 300,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
