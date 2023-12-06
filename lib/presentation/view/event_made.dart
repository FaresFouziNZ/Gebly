import 'package:flutter/material.dart';
import '../widget/event_code.dart';

class EventMadeView extends StatelessWidget {
  const EventMadeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: EventCode()),
    );
  }
}
