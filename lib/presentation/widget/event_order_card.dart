import 'package:flutter/material.dart';
import 'package:gebly/core/models/item.dart';

class EventOrderCard extends StatelessWidget {
  final Item item;
  final int? quantity;
  const EventOrderCard({
    super.key,
    required this.item,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/83x100"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(item.name),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              "x$quantity",
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          // CircleAvatar(
                          //   radius: 14,
                          //   backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                          //   child: Icon(Icons.edit, size: 10, color: Theme.of(context).colorScheme.onPrimaryContainer),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
