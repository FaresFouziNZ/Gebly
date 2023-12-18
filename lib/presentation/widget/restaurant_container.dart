import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  // final String name;
  // final String image;

  const RestaurantCard({
    Key? key,
    // required this.name,
    // required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.145,
        width: MediaQuery.of(context).size.width * 0.44,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.145,
              width: MediaQuery.of(context).size.width * 0.44,
              decoration: ShapeDecoration(
                image:
                    const DecorationImage(image: NetworkImage('https://via.placeholder.com/83x100'), fit: BoxFit.cover),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          const Text(
                            'Restaurant Name',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          const Spacer(),
                          GestureDetector(
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      )),
                    ),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text('11am - 11pm', style: TextStyle(fontSize: 12)),
                        ),
                        Icon(
                          Icons.watch_later_outlined,
                          size: 20,
                        ),
                        Spacer(),
                        Text(
                          '8.9 km',
                          style: TextStyle(fontSize: 12),
                        ),
                        Icon(Icons.location_pin, size: 20)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4),
              child: Positioned(
                  left: 0,
                  top: 0,
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF7CFF89),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text('open'),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
