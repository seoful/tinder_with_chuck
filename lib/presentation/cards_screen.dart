import 'package:auto_size_text/auto_size_text.dart';
import 'package:chuck_norris/managers/cards_manager.dart';
import 'package:chuck_norris/managers/memory_manager.dart';
import 'package:chuck_norris/presentation/components/animated_button.dart';
import 'package:chuck_norris/presentation/components/custom_elevated_button.dart';
import 'package:chuck_norris/presentation/notifier/cards_screen_notifier.dart';
import 'package:chuck_norris/presentation/notifier/cards_screen_state.dart';
import 'package:chuck_norris/presentation/profile_info_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class CardsScreen extends ConsumerWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cardsScreenNotifierProvider);

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
                            "#${ref.read(memoryManagerProvider).memoryData.seen + 1}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: state.maybeWhen(
                                orElse: () => Colors.transparent,
                                data: (joke) => Colors.black,
                              ),
                            ),
                          ),
                          AnimatedButton(
                            onTap: () => showPersonalInfoDialog(context),
                            child: const Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
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
                              start: () => Image.asset("assets/logo.png"),
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
                                  const Text("Something went wrong"),
                                  const SizedBox(height: 20),
                                  CustomElevatedButton(
                                    child: const Text("Retry"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: state.maybeWhen(
                  start: () => [
                    CustomElevatedButton(
                      child: const Text("Start"),
                      onTap: () => _onStartOrRetryTap(ref),
                    ),
                  ],
                  orElse: () => [
                    CustomElevatedButton(
                      child: const Icon(
                        Icons.thumb_down,
                        color: Colors.red,
                      ),
                      onTap: () => _ondisikeTap(ref, state),
                    ),
                    const SizedBox(width: 20),
                    CustomElevatedButton(
                      child: const Icon(
                        Icons.language,
                        color: Colors.blue,
                      ),
                      onTap: () => _onShowInBrowserTap(state),
                    ),
                    const SizedBox(width: 20),
                    CustomElevatedButton(
                      child: const Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                      ),
                      onTap: () => _onLikeTap(ref, state),
                    ),
                  ],
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

  void _ondisikeTap(WidgetRef ref, CardsScreenState state) {
    if (state is Data) {
      ref.read(cardsManagerProvider).dislikeJoke();
    }
  }

  void _onShowInBrowserTap(CardsScreenState state) {
    if (state is Data) {
      launchUrl(Uri.parse(state.joke.url));
    }
  }
}
