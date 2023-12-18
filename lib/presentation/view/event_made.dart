import 'package:flutter/material.dart';
import 'package:gebly/presentation/widget/event_info.dart';
import 'package:gebly/presentation/widget/user_order.dart';
import '../widget/event_code.dart';

class EventMadeView extends StatelessWidget {
  const EventMadeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomScrollView(
        slivers: [
          SliverAppBar.medium(
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
                EventCode(),
                EventInfo(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7))),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.075,
              decoration: ShapeDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7)))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Participants',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiaryContainer,
                            fontSize: 12,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          '3',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surfaceTint,
                            fontSize: 22,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Meals',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiaryContainer,
                            fontSize: 12,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          '7',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surfaceTint,
                            fontSize: 22,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 15),
                      child: Container(
                        width: 135,
                        height: 33,
                        decoration: ShapeDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Show order',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w400,
                                height: 0.10,
                                letterSpacing: 0.25,
                              ),
                            ),
                            Icon(
                              Icons.article_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const UserOrder()
          ],
        ),
      ),
    );
  }
}
