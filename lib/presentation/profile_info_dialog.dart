import 'package:chuck_norris/managers/memory_manager.dart';
import 'package:chuck_norris/presentation/components/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInfo extends ConsumerWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(memoryManagerProvider).memoryData;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Jokes liked: ${info.liked}"),
        Text("Jokes disliked: ${info.disliked}"),
        Text("Jokes seen: ${info.seen}"),
      ],
    );
  }
}

Future<void> showPersonalInfoDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: const ProfileInfo(),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        AnimatedButton(
          onTap: () => Navigator.pop(context),
          child: const Text(
            "Ок",
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    ),
  );
}
