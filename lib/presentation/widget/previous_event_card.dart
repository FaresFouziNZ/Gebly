import 'package:flutter/material.dart';

class PreviousEventCard extends StatelessWidget {
  const PreviousEventCard({
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Khalid event"),
                          Text('8 participants',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              )),
                          const Text("13 SAR"),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
          Positioned(
            right: 25,
            bottom: 0,
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward),
                label: const Text('View event'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  disabledForegroundColor: Colors.grey.withOpacity(0.38),
                  disabledBackgroundColor: Colors.grey.withOpacity(0.12),
                )),
          )
        ],
      ),
    );
  }
}
