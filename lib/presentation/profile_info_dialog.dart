import 'package:chuck_norris/presentation/components/animated_button.dart';
import 'package:chuck_norris/s.dart';
import 'package:chuck_norris/state_holders/statistics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInfo extends ConsumerWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(statisticsNotifierProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("${S.of(context).jokes_liked} ${info.liked}"),
        Text("${S.of(context).jokes_disliked} ${info.disliked}"),
        Text("${S.of(context).jokes_seen} ${info.seen}"),
      ],
    );
  }
}

Future<void> openPersonalInfoScreen(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: const ProfileInfo(),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        AnimatedButton(
          onTap: () => Navigator.pop(context),
          child: Text(
            S.of(context).ok,
            style: const TextStyle(color: Colors.blue),
          ),
        )
      ],
    ),
  );
}
