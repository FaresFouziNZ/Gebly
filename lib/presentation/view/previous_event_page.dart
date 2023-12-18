import 'package:flutter/material.dart';
import 'package:gebly/presentation/widget/previous_event_card.dart';

class PreviousEventPage extends StatelessWidget {
  const PreviousEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            pinned: false,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Previous Events'),
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
          const SliverToBoxAdapter(
            child: Column(
              children: [
                PreviousEventCard(),
                PreviousEventCard(),
                PreviousEventCard(),
                PreviousEventCard(),
                PreviousEventCard(),
                PreviousEventCard(),
                PreviousEventCard(),
                PreviousEventCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
