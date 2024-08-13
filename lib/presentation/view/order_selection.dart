import 'package:flutter/material.dart';
import 'package:gebly/core/models/restaurant.dart';
import 'package:gebly/core/providers/cart_provider.dart';
import 'package:gebly/presentation/widget/item_card.dart';
import 'package:gebly/view_models/order_selection_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderSelection extends ConsumerStatefulWidget {
  final Restaurant restaurant;
  const OrderSelection({super.key, required this.restaurant});

  @override
  ConsumerState<OrderSelection> createState() => _OrderSelectionState();
}

class _OrderSelectionState extends ConsumerState<OrderSelection> {
  final viewModel = OrderSelectionViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: GestureDetector(
              child: const Text('Select your order'),
              onTap: () {
                // final x = ref.read(cartProvider);
              },
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 4.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 4.0,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              // width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 83,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.restaurant.logoUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.restaurant.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Row(
                          children: [
                            Icon(Icons.watch_later_outlined),
                            SizedBox(width: 5),
                            Text(
                              'Working Hours:',
                            ),
                            SizedBox(width: 5),
                            Text(
                              '11:00am - 3:00 am',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     width: MediaQuery.of(context).size.width * 0.9,
          //     height: 48,
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Expanded(
          //           child: Container(
          //             height: 48,
          //             clipBehavior: Clip.antiAlias,
          //             decoration: const BoxDecoration(color: Color(0xFFFFF8F7)),
          //             child: Row(
          //               mainAxisSize: MainAxisSize.min,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.end,
          //               children: [
          //                 Expanded(
          //                   child: Container(
          //                     height: double.infinity,
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 16),
          //                     child: Column(
          //                       mainAxisSize: MainAxisSize.min,
          //                       mainAxisAlignment: MainAxisAlignment.end,
          //                       crossAxisAlignment: CrossAxisAlignment.center,
          //                       children: [
          //                         Expanded(
          //                           child: SizedBox(
          //                             width: 69,
          //                             child: Column(
          //                               mainAxisSize: MainAxisSize.min,
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.end,
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.center,
          //                               children: [
          //                                 const Text(
          //                                   'Gathering',
          //                                   textAlign: TextAlign.center,
          //                                 ),
          //                                 SizedBox(
          //                                   width: 69,
          //                                   height: 14,
          //                                   child: Stack(
          //                                     children: [
          //                                       Positioned(
          //                                         left: 2,
          //                                         top: 11,
          //                                         child: Container(
          //                                           width: 65,
          //                                           height: 3,
          //                                           decoration:
          //                                               const ShapeDecoration(
          //                                             color: Color(0xFFB42341),
          //                                             shape:
          //                                                 RoundedRectangleBorder(
          //                                               borderRadius:
          //                                                   BorderRadius.only(
          //                                                 topLeft:
          //                                                     Radius.circular(
          //                                                         100),
          //                                                 topRight:
          //                                                     Radius.circular(
          //                                                         100),
          //                                               ),
          //                                             ),
          //                                           ),
          //                                         ),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         Expanded(
          //           child: Container(
          //             height: 48,
          //             clipBehavior: Clip.antiAlias,
          //             decoration: const BoxDecoration(color: Color(0xFFFFF8F7)),
          //             child: Row(
          //               mainAxisSize: MainAxisSize.min,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.end,
          //               children: [
          //                 Expanded(
          //                   child: Container(
          //                     height: double.infinity,
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 16),
          //                     child: Column(
          //                       mainAxisSize: MainAxisSize.min,
          //                       mainAxisAlignment: MainAxisAlignment.end,
          //                       crossAxisAlignment: CrossAxisAlignment.center,
          //                       children: [
          //                         Expanded(
          //                           child: Container(
          //                             width: 90,
          //                             padding:
          //                                 const EdgeInsets.only(bottom: 14),
          //                             child: const Column(
          //                               mainAxisSize: MainAxisSize.min,
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.center,
          //                               children: [
          //                                 Text(
          //                                   'Sandwiches',
          //                                   textAlign: TextAlign.center,
          //                                   style: TextStyle(
          //                                     height: 0.10,
          //                                     letterSpacing: 0.10,
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         Expanded(
          //           child: Container(
          //             height: 48,
          //             clipBehavior: Clip.antiAlias,
          //             decoration: const BoxDecoration(color: Color(0xFFFFF8F7)),
          //             child: Row(
          //               mainAxisSize: MainAxisSize.min,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.end,
          //               children: [
          //                 Expanded(
          //                   child: Container(
          //                     height: double.infinity,
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 16),
          //                     child: Column(
          //                       mainAxisSize: MainAxisSize.min,
          //                       mainAxisAlignment: MainAxisAlignment.end,
          //                       crossAxisAlignment: CrossAxisAlignment.center,
          //                       children: [
          //                         Expanded(
          //                           child: Container(
          //                             width: 90,
          //                             padding:
          //                                 const EdgeInsets.only(bottom: 14),
          //                             child: const Column(
          //                               mainAxisSize: MainAxisSize.min,
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.end,
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.center,
          //                               children: [
          //                                 Text(
          //                                   'Sides',
          //                                   textAlign: TextAlign.center,
          //                                   style: TextStyle(
          //                                     height: 0.10,
          //                                     letterSpacing: 0.10,
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: FutureBuilder(
                future: null,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  // viewModel.setMenu(snapshot.data ?? [], ref);
                  return Column(
                    children: ref
                        .read(cartProvider)
                        .keys
                        .map((item) => ItemCard(
                            item: item,
                            onTap: () {
                              setState(() {});
                            }))
                        .toList(),
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        // width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.085,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(7),
            topRight: Radius.circular(7),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  if (viewModel.ableToProceed(ref)) {
                    context.push('/order-confirm');
                  }
                },
                child: Container(
                  width: 256,
                  height: 54,
                  decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.shopping_cart_checkout,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      Text("Proceed to confirmation",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer)),
                      // Padding(
                      //   padding: const EdgeInsets.all(4.0),
                      //   child: Text("50 SR", style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer)),
                      // )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 67,
                height: 54,
                decoration: ShapeDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        viewModel.getCartItemCount(ref),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                      Text("Items",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer))
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
