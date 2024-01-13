import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventInfo extends ConsumerWidget {
  const EventInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 5, 5),
          child: Row(children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Payment method',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
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
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Deadline',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 12,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '7:00 pm',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
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
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Restaurant',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 12,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Albaik',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
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
      ),
    );
  }
}
