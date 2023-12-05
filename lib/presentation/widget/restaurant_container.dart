import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String image;

  const RestaurantCard({required Key key, required this.name, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.145,
      width: MediaQuery.of(context).size.width * 0.44,
      child: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.145,
          width: MediaQuery.of(context).size.width * 0.44,
          decoration: ShapeDecoration(
            image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.145,
          width: MediaQuery.of(context).size.width * 0.44,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            gradient: LinearGradient(
              begin: const Alignment(0.00, -1.00),
              end: const Alignment(0, 1),
              colors: [Colors.black.withOpacity(0), Colors.black],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.arrow_back, color: Colors.white, size: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                    letterSpacing: 0.14,
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
