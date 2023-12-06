import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 386,
      height: 110,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Row(children: [
          Column(
            children: [
              const Text(
                'Payment method',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/Stc_pay.png',
                width: 70,
              )
            ],
          ),
          const Spacer(),
          const Column(
            children: [
              Text(
                'Deadline',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '7:00 pm',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w600,
                  height: 0.09,
                  letterSpacing: 0.50,
                ),
              )
            ],
          ),
          const Spacer(),
          const Column(
            children: [
              Text(
                'Restaurant',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Albaik',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w600,
                  height: 0.09,
                  letterSpacing: 0.50,
                ),
              )
            ],
          ),
          const Spacer(),
          Image.asset('assets/images/albaikLogo.png')
        ]),
      ),
    );
  }
}
