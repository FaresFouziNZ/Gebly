import 'package:flutter/material.dart';
import 'package:gebly/core/models/item.dart';

class SummeryItemCard extends StatelessWidget {
  final Item item;
  const SummeryItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
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
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item.photoUrl),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text("${item.price} SAR"),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.close,
                            size: 15,
                            color: Theme.of(context).colorScheme.scrim))
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
