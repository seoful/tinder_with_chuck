import 'package:chuck_norris/managers/cards_manager.dart';
import 'package:chuck_norris/presentation/components/animated_button.dart';
import 'package:chuck_norris/s.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategorySelectionDialog extends ConsumerWidget {
  const CategorySelectionDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(cardsManagerProvider).categories;
    final currentCategory = ref.watch(cardsManagerProvider).currentCategory;

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: categories
            .map(
              (category) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: AnimatedButton(
                  onTap: () => _setCategory(context, ref, category),
                  child: Text(
                    category.toUpperCase(),
                    style: TextStyle(
                      fontWeight: currentCategory == category
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            )
            .toList()
          ..insert(
            0,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: AnimatedButton(
                onTap: () => _setCategory(context, ref, null),
                child: Text(
                  S.of(context).none.toUpperCase(),
                  style: TextStyle(
                    fontWeight: currentCategory == null
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }

  void _setCategory(BuildContext context, WidgetRef ref, String? category) {
    Navigator.pop(context);
    ref.read(cardsManagerProvider).setCategory(category);
  }
}

Future<void> openChooseCategoryDialog(
  BuildContext context,
) async {
  showDialog(
    context: context,
    builder: (context) => const CategorySelectionDialog(),
  );
}
