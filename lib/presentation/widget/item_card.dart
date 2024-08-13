import 'package:flutter/material.dart';
import 'package:gebly/core/models/item.dart';
import 'package:gebly/view_models/item_card_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemCard extends ConsumerStatefulWidget {
  final Item item;
  final Function() onTap;
  const ItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  ConsumerState<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends ConsumerState<ItemCard> {
  @override
  Widget build(BuildContext context) {
    // final myValue = ref.watch(cartProvider);
    final viewModel = ItemCardViewModel();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.item.photoUrl),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.item.name),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.edit,
                                    size: 15,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                const SizedBox(width: 5),
                                Text.rich(
                                  TextSpan(
                                    text: 'Customize',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text('${widget.item.price.toString()} SAR'),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
          Positioned(
            right: 25,
            bottom: 0,
            child: Visibility(
              visible: viewModel.getItemCount(ref, widget.item) == '0',
              replacement: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          viewModel.decrementItem(ref, widget.item);
                        });
                        widget.onTap();
                        // setState(() {});
                      },
                      child: const Icon(Icons.remove),
                    ),
                    Text(
                      viewModel.getItemCount(ref, widget.item),
                      style: const TextStyle(fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          viewModel.incrementItem(ref, widget.item);
                        });
                        widget.onTap();
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    viewModel.incrementItem(ref, widget.item);
                  });
                  widget.onTap();
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add to cart'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  disabledForegroundColor: Colors.grey.withOpacity(0.38),
                  disabledBackgroundColor: Colors.grey.withOpacity(0.12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
