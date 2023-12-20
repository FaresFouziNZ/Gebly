import 'package:flutter/material.dart';
import 'package:gebly/core/models/database_user.dart';
import 'package:gebly/core/providers/event_provider.dart';
import 'package:gebly/core/services/database_queries.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ParticipantCard extends ConsumerWidget {
  final DatabaseUser user;
  const ParticipantCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(user.firstName[0].toUpperCase()),
                    ),
                  ),
                  Text('${user.firstName} ${user.lastName}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: FutureBuilder(
                  future: DatabaseServices().getOrder(uid: user.id, eventID: ref.watch(eventProvider).id!),
                  builder: (context, snapshot) {
                    return Text(
                      "${snapshot.data?.orderTotal.toString() ?? '0.00'} SAR",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
