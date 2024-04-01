import 'package:flutter/material.dart';
import 'package:gebly/core/models/restaurant.dart';
import 'package:gebly/view_models/restaurant_card_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RestaurantCard extends ConsumerWidget {
  final Restaurant restaurant;
  const RestaurantCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = RestaurantCardViewModel();
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          viewModel.loadMenu(restaurantId: restaurant.id, ref: ref);
          context.push('/order-selection', extra: restaurant);
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.145,
          width: MediaQuery.of(context).size.width * 0.44,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.145,
                width: MediaQuery.of(context).size.width * 0.44,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                      image: NetworkImage(restaurant.logoUrl),
                      fit: BoxFit.contain),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  color: Colors.black.withOpacity(0.5),
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
                            Text(
                              restaurant.name,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
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
                      decoration: ShapeDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        )),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                        child: Row(
                          children: [
                            Text(viewModel.getOpenHours(restaurant.openHours),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant)),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.watch_later_outlined,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              size: 20,
                            ),
                            const Spacer(),
                            Text(
                              '8.9 km',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant),
                            ),
                            Icon(Icons.location_pin,
                                size: 20,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text(
                          'open',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
