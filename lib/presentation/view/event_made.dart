import 'package:flutter/material.dart';
import 'package:gebly/presentation/widget/event_info.dart';
import 'package:gebly/presentation/widget/user_order.dart';
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
        const EventCode(), //this is the widget with the event code displayed and a copy button and status
        const EventInfo(), //this is the widget that displays payment method, deadline, restaurant name and logo
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
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 386,
                height: 67,
                decoration: const ShapeDecoration(
                    color: Color(0xFFFFDDB8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7)))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Participants',
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
                            height: 25,
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
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            'Meals',
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
                            height: 25,
                          ),
                          Text(
                            '7',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFB42341),
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
                            color: const Color(0xFF91002C),
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
              Expanded(
                child: SizedBox(
                  width: 386,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const UserOrder();     //this is the widget that has the user who ordered and the price of the order
                      }),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
