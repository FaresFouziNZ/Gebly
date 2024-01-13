import 'package:flutter/material.dart';
import 'package:gebly/core/services/database_queries.dart';
import 'package:gebly/presentation/widget/restaurant_container.dart';

class RestaurantSelectionPage extends StatelessWidget {
  const RestaurantSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Select Restaurant',
                style: TextStyle(fontSize: 32),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 4.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 4.0,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.31,
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).colorScheme.surface,
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              labelText: 'Search for a restaurant',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Trending',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.close,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                )
                              ],
                            ),
                          ),
                          FutureBuilder(
                              future: DatabaseServices().getNearRestaurants(limit: 2),
                              builder: (context, snapshot) {
                                return Wrap(
                                  children: snapshot.data
                                          ?.map((restaurant) => RestaurantCard(
                                                restaurant: restaurant,
                                              ))
                                          .toList() ??
                                      [],
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: DatabaseServices().getNearRestaurants(),
                      builder: (context, snapshot) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Wrap(
                              children: snapshot.data
                                      ?.map((restaurant) => RestaurantCard(
                                            restaurant: restaurant,
                                          ))
                                      .toList() ??
                                  []),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
