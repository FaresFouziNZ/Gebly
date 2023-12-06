import 'package:flutter/material.dart';
import 'package:gebly/presentation/widget/event_info.dart';
import '../widget/event_code.dart';

class EventMadeView extends StatelessWidget {
  const EventMadeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), //TODO: appbar
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(
          height: 20,
        ),
        const EventCode(),
        const EventInfo(),
        Container(
          width: 428,
          height: 350,
          decoration: const ShapeDecoration(
            color: Color(0xFFB42341),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7))),
          ),
          child: Column(
            children: [
              Container(
                width: 396,
                height: 67,
                decoration: const BoxDecoration(color: Color(0xFFFFDDB8)),
              )
            ],
          ),
        )
      ]),
    );
  }
}
