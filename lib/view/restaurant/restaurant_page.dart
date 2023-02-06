// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_express/res/drawables.dart';
import 'package:food_express/widgets/product_card.dart';
import 'package:food_express/widgets/sharer_mask_wrapper_widget.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/widgets.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key, required this.restaurantName})
      : super(key: key);
  final String restaurantName;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              titleSpacing: 0,
              elevation: 0,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // print('constraints=' + constraints.toString());
                  top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                      centerTitle: false,
                      title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: top ==
                                MediaQuery.of(context).padding.top +
                                    kToolbarHeight +
                                    31
                            ? 1.0
                            : 0.0,
                        // opacity: 1.0,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 31),
                          child: Text(
                            widget.restaurantName,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                      background: SharedMaskWrapperWidget(
                          child: Image.asset(
                        rest,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      )));
                },
              ),
              bottom: PreferredSize(
                  preferredSize: const Size(double.infinity, 31),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                      padding: const EdgeInsets.only(
                          left: 10, top: 16, bottom: 10, right: 10),
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF383838),
                        ),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 5,
                      ))),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.redAccent.withOpacity(0.4)),
                          child: const Text(
                            "Popular",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                        ),
                        Expanded(child: Container()),
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.4),
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.location_on_rounded,
                              size: 26,
                              color: Colors.redAccent,
                            )),
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.4),
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.favorite_rounded,
                              size: 26,
                              color: Colors.redAccent,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      widget.restaurantName,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_half_outlined,
                          size: 26,
                          color: Colors.redAccent.shade400,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "4.8 Rating",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.grey.shade500),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Icon(
                          Icons.shopping_bag_rounded,
                          size: 26,
                          color: Colors.redAccent.shade400,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "4k Orders",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Popular Dishes",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    AlignedGridView.count(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      crossAxisCount: kIsWeb ? 4 : 1,
                      itemCount: Random().nextInt(10),
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ProductCard(onTap: () {
                        GoRouter.of(context).push("/home/restaurant/product",
                            extra: generateRandomString(10));
                      }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

String generateRandomString(int len) {
  var r = Random();
  const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
}
