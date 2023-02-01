import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_express/res/drawables.dart';
import 'package:food_express/widgets/restaurant_card.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/widgets.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 25,
                  child: Text(
                    "Find Your\nFavorite Food",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
                const Expanded(
                  flex: 7,
                  child: SizedBox(),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.redAccent.withOpacity(.6),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_outlined,
                        size: 24,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "what do you want to order?",
                        prefixIcon:
                            Icon(Icons.search_rounded, color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list_alt,
                        size: 24,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Popular Restaurants",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: AlignedGridView.count(
              crossAxisCount: 2,
              itemCount: 10,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              shrinkWrap: true,
              itemBuilder: (context, index) =>  InkWell(
                onTap: () {
                  context.go("/home/product");
                },
                child: RestaurantCard(
                    name: "Vegan Resto",
                    duration: "12 mins",
                    imageUrl: imageRestaurant2),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
