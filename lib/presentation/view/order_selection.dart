import 'package:flutter/material.dart';
import 'package:gebly/presentation/widget/item_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderSelection extends HookConsumerWidget {
  const OrderSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Text('HomeView'),
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
              height: 100,
              width: 392,
              child: Row(
                children: [
                  Container(
                    width: 83,
                    height: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage("https://via.placeholder.com/83x100"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Albaik',
                      ),
                      Row(
                        children: [
                          Icon(Icons.lock_clock),
                          SizedBox(width: 8),
                          Text(
                            'Working Hours',
                          ),
                          SizedBox(width: 8),
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
          SliverToBoxAdapter(
            child: SizedBox(
              width: 428,
              height: 48,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(color: Color(0xFFFFF8F7)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 69,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Gathering',
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: 69,
                                            height: 14,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 2,
                                                  top: 11,
                                                  child: Container(
                                                    width: 65,
                                                    height: 3,
                                                    decoration: const ShapeDecoration(
                                                      color: Color(0xFFB42341),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(100),
                                                          topRight: Radius.circular(100),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(color: Color(0xFFFFF8F7)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 90,
                                      padding: const EdgeInsets.only(bottom: 14),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Sandwiches',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              height: 0.10,
                                              letterSpacing: 0.10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(color: Color(0xFFFFF8F7)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 90,
                                      padding: const EdgeInsets.only(bottom: 14),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Sides',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              height: 0.10,
                                              letterSpacing: 0.10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                ItemCard(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: 428,
        height: 75,
        decoration: const BoxDecoration(color: Color(0xFF91002C)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 256,
                height: 54,
                decoration: ShapeDecoration(
                  color: const Color(0xFFB42341),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.shopping_cart_checkout,
                        color: Colors.white,
                      ),
                    ),
                    Text("Procced to confirmation", style: TextStyle(color: Colors.white)),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text("50 SR", style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 67,
                height: 54,
                decoration: ShapeDecoration(
                  color: const Color(0xFFB42341),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                ),
                child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "3",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text("Items", style: TextStyle(color: Colors.white))
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
