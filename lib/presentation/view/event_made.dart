import 'package:flutter/material.dart';
import 'package:gebly/core/providers/event_provider.dart';
import 'package:gebly/core/services/database_queries.dart';
import 'package:gebly/presentation/widget/event_info.dart';
import 'package:gebly/presentation/widget/user_order.dart';
import 'package:gebly/view_models/event_made_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widget/event_code.dart';

class EventMadeView extends ConsumerWidget {
  const EventMadeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = EventMadeViewModel();
    return Scaffold(
      body: const CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Event'),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EventCode(),
                EventInfo(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7),
              topRight: Radius.circular(7),
            ),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.075,
              decoration: ShapeDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Participants',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiaryContainer,
                            fontSize: 12,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          '3',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surfaceTint,
                            fontSize: 22,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 15),
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.edit,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          onPressed: () async {
                            final restaurant = await viewModel.getRestaurant(id: ref.read(eventProvider).restaurantID);
                            viewModel.loadMenu(restaurantId: restaurant.id, ref: ref);
                            context.push('/order-selection', extra: restaurant);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.primary,
                          )),
                          label: Text(
                            'Edit',
                            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 15),
                        child: ElevatedButton(
                          onPressed: () {
                            context.push('/event-order');
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.primary,
                          )),
                          child: Text(
                            'Show Order',
                            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: DatabaseServices().getInvolvedUsers(eventID: ref.read(eventProvider).id!),
                builder: (context, snapshot) {
                  return Column(
                    children: snapshot.data
                            ?.map((e) => UserOrder(
                                  user: e,
                                ))
                            .toList() ??
                        [],
                  );
                })
          ],
        ),
      ),
    );
  }
}
