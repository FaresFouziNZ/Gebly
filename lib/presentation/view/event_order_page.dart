import 'package:flutter/material.dart';
import 'package:gebly/core/providers/event_provider.dart';
import 'package:gebly/core/services/database_queries.dart';
import 'package:gebly/presentation/widget/event_order_card.dart';
import 'package:gebly/presentation/widget/participant_card.dart';
import 'package:gebly/view_models/event_order_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventOrderPage extends ConsumerWidget {
  const EventOrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = EventOrderViewModel();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Text('All Orders'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 4.0,
                    color: Theme.of(context).colorScheme.primary,
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
                  Column(
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.6,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        child: FutureBuilder(
                            future: viewModel.getItems(eventID: ref.read(eventProvider).id!, ref: ref),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState != ConnectionState.done) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return SingleChildScrollView(
                                child: Column(
                                  children: snapshot.data?.keys
                                          .map((key) => EventOrderCard(
                                                item: key,
                                                quantity: snapshot.data?[key],
                                              ))
                                          .toList() ??
                                      [],
                                ),
                              );
                            }),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                    ],
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Participants',
                    style: TextStyle(
                        fontSize: 24, color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.bold),
                  ),
                ),
                FutureBuilder(
                    future: DatabaseServices().getInvolvedUsers(eventID: ref.read(eventProvider).id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        );
                      }
                      return Column(
                        children: snapshot.data
                                ?.map((e) => ParticipantCard(
                                      user: e,
                                    ))
                                .toList() ??
                            [],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
