import 'package:flutter/material.dart';
import 'package:gebly/core/models/event.dart';
import 'package:gebly/core/providers/event_provider.dart';
import 'package:gebly/presentation/widget/event_code.dart';
import 'package:gebly/presentation/widget/event_info.dart';
import 'package:gebly/view_models/event_info_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventInfoPage extends ConsumerWidget {
  final Event event;
  const EventInfoPage({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = EventInfoViewModel();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.medium(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Event Info'),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EventCode(event1: event),
                const EventInfo(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Check the restaurant',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: ElevatedButton(
                    onPressed: () async {
                      ref.read(eventProvider.notifier).state = event;
                      viewModel.joinEvent(ref, event);
                      context.go('/order-selection');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.075),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: Text('Join',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary, fontSize: 32, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
