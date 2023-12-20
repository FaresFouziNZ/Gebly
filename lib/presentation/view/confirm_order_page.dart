import 'package:flutter/material.dart';
import 'package:gebly/presentation/widget/summary_item_total.dart';
import 'package:gebly/presentation/widget/summery_item_card.dart';
import 'package:gebly/view_models/confirm_order_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmOrderPage extends ConsumerStatefulWidget {
  const ConfirmOrderPage({super.key});

  @override
  ConsumerState<ConfirmOrderPage> createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends ConsumerState<ConfirmOrderPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ConfirmOrderViewModel();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Text('Confirm Order'),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    child: Column(
                      children: viewModel.getCartItems(ref).map((item) => SummeryItemCard(item: item)).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          color: Colors.transparent,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                          child: Column(
                            children: viewModel.getCartItems(ref).map((item) => SummaryItemTotal(item: item)).toList(),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.scrim,
                      thickness: 3,
                      endIndent: 16,
                      indent: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            '${viewModel.getTotalPrice(ref).toStringAsFixed(2)} SAR',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        onPressed: () async {
                          await viewModel.confirmOrder(ref);
                          if (mounted) {
                            context.go('/event-made');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: const Text('Confirm'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
