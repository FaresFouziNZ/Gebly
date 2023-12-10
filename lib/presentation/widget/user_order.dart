import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserOrder extends HookConsumerWidget {
  const UserOrder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 386,
        height: 81,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              child: Text('A'),
            ),
            Text(
              'Meals:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w500,
                height: 0.09,
                letterSpacing: 0.15,
              ),
            ),
            Text(
              '3',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFB42341),
                fontSize: 22,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w400,
                height: 0.06,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              '50 ' 'SAR',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w500,
                height: 0.09,
                letterSpacing: 0.15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
