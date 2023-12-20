import 'package:flutter/material.dart';
import 'package:gebly/core/models/item.dart';
import 'package:gebly/view_models/item_card_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SummaryItemTotal extends ConsumerWidget {
  final Item item;
  const SummaryItemTotal({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ItemCardViewModel();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            'x${viewModel.getItemCount(ref, item)}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          Text(
            item.name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            "${viewModel.getTotalPrice(ref, item)} SAR",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
