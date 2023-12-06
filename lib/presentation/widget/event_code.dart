import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventCode extends StatelessWidget {
  const EventCode({super.key});

  @override
  Widget build(BuildContext context) {
    String code = 'BRYDLT';
    return Container(
      width: 386,
      height: 100,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 61,
            top: 50,
            child: Text(
              code,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 52,
                fontFamily: 'Readex Pro',
                fontWeight: FontWeight.w400,
                height: 0.02,
                letterSpacing: -0.25,
              ),
            ),
          ),
          Positioned(
              right: 15,
              top: 20,
              child: IconButton(
                iconSize: 46,
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: code));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Code copied!')));
                },
                icon: const Icon(Icons.content_copy_outlined, color: Colors.black),
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
                      color: true ? const Color(0xFF7CFF89) : const Color.fromARGB(255, 239, 57, 57),
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
    );
  }
}
