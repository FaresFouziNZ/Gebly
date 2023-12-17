import 'package:flutter/material.dart';

class SummeryItemCard extends StatelessWidget {
  const SummeryItemCard({
    super.key,
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
                color: Theme.of(context).colorScheme.surface,
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
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("7 pieces mushroom"),
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.min,
                          //     children: [
                          //       Icon(Icons.edit, size: 15, color: Theme.of(context).colorScheme.secondary),
                          //       const SizedBox(width: 5),
                          //       Text.rich(
                          //         TextSpan(
                          //           text: 'Customize',
                          //           style: TextStyle(
                          //             color: Theme.of(context).colorScheme.secondary,
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          Text("13 SAR"),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.close, size: 15, color: Theme.of(context).colorScheme.scrim))
                  ],
                ),
              )
            ]),
          ),
          // Positioned(
          //   right: 25,
          //   bottom: 0,
          //   child: ElevatedButton.icon(
          //       onPressed: () {},
          //       icon: const Icon(Icons.add_shopping_cart),
          //       label: const Text('Add to cart'),
          //       style: ElevatedButton.styleFrom(
          //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          //         foregroundColor: Colors.white,
          //         backgroundColor: Theme.of(context).colorScheme.primary,
          //         disabledForegroundColor: Colors.grey.withOpacity(0.38),
          //         disabledBackgroundColor: Colors.grey.withOpacity(0.12),
          //       )),
          // )
        ],
      ),
    );
  }
}
