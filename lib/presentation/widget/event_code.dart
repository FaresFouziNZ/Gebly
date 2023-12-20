import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gebly/core/models/event.dart';
import 'package:gebly/core/providers/event_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventCode extends ConsumerWidget {
  final Event? event1;
  const EventCode({super.key, this.event1});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(eventProvider);
    String code = 'BRYDLT';
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.13,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 61,
              top: 64,
              child: Text(
                event.code == '' ? event1?.code ?? "null" : event.code,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 57,
                  fontFamily: 'Readex Pro',
                  fontWeight: FontWeight.w400,
                  height: 0.02,
                  letterSpacing: -0.25,
                ),
              ),
            ),
            Positioned(
                right: 15,
                top: 32,
                child: IconButton(
                  iconSize: 46,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: code));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Code copied!')));
                  },
                  icon: Icon(Icons.content_copy_outlined, color: Theme.of(context).colorScheme.onSurface),
                )),
            Positioned(
                left: 9,
                top: 5,
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF7CFF89),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text('Status: open'),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
