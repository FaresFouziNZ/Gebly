import 'package:flutter/material.dart';
import 'package:gebly/presentation/widget/event_code.dart';
import 'package:gebly/presentation/widget/event_info.dart';

class EventInfoPage extends StatelessWidget {
  const EventInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.medium(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Alo Event'),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const EventCode(),
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
                        Text('Check the restaurant',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
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
                    onPressed: () {},
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
