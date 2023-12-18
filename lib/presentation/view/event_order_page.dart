import 'package:flutter/material.dart';
import 'package:gebly/presentation/widget/event_order_card.dart';
import 'package:gebly/presentation/widget/participant_card.dart';

class EventOrderPage extends StatelessWidget {
  const EventOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    height: MediaQuery.of(context).size.height * 0.6,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const EventOrderCard(),
                          const EventOrderCard(),
                          const EventOrderCard(),
                          const EventOrderCard(),
                          const EventOrderCard(),
                          const EventOrderCard(),
                          const EventOrderCard(),
                          const EventOrderCard(),
                          const EventOrderCard(),
                          const EventOrderCard(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          )
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
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Participants',
                  style: TextStyle(
                      fontSize: 24, color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.bold),
                ),
                const ParticipantCard(),
                const ParticipantCard(),
                const ParticipantCard(),
                const ParticipantCard(),
                const ParticipantCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
