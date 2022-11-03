import 'package:auto_size_text/auto_size_text.dart';
import 'package:chuck_norris/assets.dart';
import 'package:chuck_norris/domain/joke.dart';
import 'package:chuck_norris/managers/cards_manager.dart';
import 'package:chuck_norris/managers/favourites_manager.dart';
import 'package:chuck_norris/presentation/category_selection_dialog.dart';
import 'package:chuck_norris/presentation/components/animated_button.dart';
import 'package:chuck_norris/presentation/components/custom_icon_elevated_button.dart';
import 'package:chuck_norris/presentation/components/custom_elevated_button.dart';
import 'package:chuck_norris/presentation/favourites/favourites_screen.dart';
import 'package:chuck_norris/presentation/favourites/notifiers/favourites_notifier.dart';
import 'package:chuck_norris/presentation/main_screen/notifier/cards_screen_notifier.dart';
import 'package:chuck_norris/presentation/main_screen/notifier/cards_screen_state.dart';
import 'package:chuck_norris/presentation/profile_info_dialog.dart';
import 'package:chuck_norris/s.dart';
import 'package:chuck_norris/state_holders/statistics_state_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class CardsScreen extends ConsumerWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cardsScreenNotifierProvider);

    final joke = state.maybeWhen(
      orElse: () => null,
      data: (joke) => joke,
    );

    final jokeInFavourites = ref.watch(favouritesNotifierProvider).maybeWhen(
          orElse: () => false,
          data: (data) => joke != null
              ? data.where((element) => element.id == joke.id).isNotEmpty
              : false,
        );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 10),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "#${ref.read(statisticsNotifierProvider).seen + 1}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: state.maybeWhen(
                                orElse: () => Colors.transparent,
                                data: (joke) => Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedButton(
                                onTap: () => openPersonalInfoScreen(context),
                                child: const Icon(
                                  Icons.signal_cellular_alt,
                                  color: Colors.blue,
                                ),
                              ),
                              if (state is Data) ...[
                                const SizedBox(width: 10),
                                AnimatedButton(
                                  onTap: () =>
                                      openChooseCategoryDialog(context),
                                  child: const Icon(
                                    Icons.menu,
                                    color: Colors.blue,
                                  ),
                                ),
                              ]
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                          switchInCurve: Curves.easeOut,
                          switchOutCurve: Curves.easeOut,
                          child: Center(
                            key: ValueKey(state),
                            child: state.when(
                              start: () => Image.asset(Assets.logo),
                              data: (joke) => AutoSizeText(
                                joke.value,
                                minFontSize: 20,
                                maxFontSize: 50,
                                overflowReplacement: SingleChildScrollView(
                                  child: Text(
                                    joke.value,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              error: () => Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(S.of(context).something_went_wrong),
                                  const SizedBox(height: 20),
                                  CustomElevatedButton(
                                    child: Text(S.of(context).retry),
                                    onTap: () => _onStartOrRetryTap(ref),
                                  )
                                ],
                              ),
                              loading: () => const CupertinoActivityIndicator(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: state.maybeWhen(
                    start: () => [
                      CustomElevatedButton(
                        child: Text(S.of(context).start),
                        onTap: () => _onStartOrRetryTap(ref),
                      ),
                    ],
                    orElse: () => [
                      ...state.maybeWhen(
                        orElse: () => [],
                        data: (joke) => [
                          CustomIconElevatedButton(
                            icon: Icons.person_rounded,
                            iconColor: Colors.blue,
                            onTap: () => _onOpenFavouritesScreen(context),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height / 32,
                          ),
                        ],
                      ),
                      CustomIconElevatedButton(
                        icon: Icons.thumb_down,
                        iconColor: Colors.red,
                        onTap: () => _onDisikeTap(ref, state),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.height / 32),
                      CustomIconElevatedButton(
                        icon: Icons.language,
                        iconColor: Colors.blue,
                        onTap: () => _onShowInBrowserTap(state),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.height / 32),
                      CustomIconElevatedButton(
                        icon: Icons.thumb_up,
                        iconColor: Colors.green,
                        onTap: () => _onLikeTap(ref, state),
                      ),
                      ...state.maybeWhen(
                        orElse: () => [],
                        data: (joke) => [
                          SizedBox(
                            width: MediaQuery.of(context).size.height / 32,
                          ),
                          CustomIconElevatedButton(
                            icon: jokeInFavourites
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            iconColor: Colors.red,
                            onTap: () => _onAddRemoveFavouritesTap(
                              ref,
                              joke,
                              jokeInFavourites,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onStartOrRetryTap(WidgetRef ref) {
    ref.read(cardsManagerProvider).start();
  }

  void _onLikeTap(WidgetRef ref, CardsScreenState state) {
    if (state is Data) {
      ref.read(cardsManagerProvider).likeJoke();
    }
  }

  void _onDisikeTap(WidgetRef ref, CardsScreenState state) {
    if (state is Data) {
      ref.read(cardsManagerProvider).dislikeJoke();
    }
  }

  void _onShowInBrowserTap(CardsScreenState state) {
    if (state is Data) {
      launchUrl(Uri.parse(state.joke.url));
    }
  }

  _onAddRemoveFavouritesTap(WidgetRef ref, Joke joke, bool jokeInFavourites) {
    if (jokeInFavourites) {
      ref.read(favouritesManagerProvider).removeFromFavourites(joke.id);
    } else {
      ref.read(favouritesManagerProvider).addToFavourites(joke);
    }
  }

  _onOpenFavouritesScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FavouritesScreen(),
      ),
    );
  }
}
