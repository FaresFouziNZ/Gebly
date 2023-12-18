import 'package:flutter/material.dart';
import 'package:gebly/presentation/widget/join_event_widget.dart';

class JoinEventPage extends StatelessWidget {
  const JoinEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverAppBar.medium(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Join Event',
            style: TextStyle(fontSize: 32),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.086,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(27.0),
                                bottomLeft: Radius.circular(27.0),
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.36,
                          height: MediaQuery.of(context).size.height * 0.086,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(27.0),
                                bottomRight: Radius.circular(27.0),
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text('Enter event code to join',
                            style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: JoinEventWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.95, 50),
                    ),
                    child: Text(
                      'Join Event',
                      style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onPrimary),
                    )),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
