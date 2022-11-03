import 'package:chuck_norris/domain/joke.dart';
import 'package:chuck_norris/managers/favourites_manager.dart';
import 'package:chuck_norris/presentation/components/animated_button.dart';
import 'package:chuck_norris/presentation/favourites/notifiers/favourites_notifier.dart';
import 'package:chuck_norris/s.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesScreen extends ConsumerWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourites = ref.watch(favouritesNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).favourites,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: favourites.when(
        data: (jokes) => ListView.builder(
          itemBuilder: (context, index) => _FavouriteJoke(jokes[index]),
          itemCount: jokes.length,
        ),
        empty: () => Center(
          child: Text(S.of(context).no_favourites),
        ),
      ),
    );
  }
}

class _FavouriteJoke extends ConsumerWidget {
  const _FavouriteJoke(this.joke);

  final Joke joke;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            joke.value,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedButton(
            onTap: () => ref
                .read(favouritesManagerProvider)
                .removeFromFavourites(joke.id),
            child: Text(
              S.of(context).delete,
              style: const TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
