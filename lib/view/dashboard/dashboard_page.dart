import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_express/res/drawables.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.redAccent,
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            color: Colors.white,
                            Icons.notifications_outlined,
                            size: 24,
                          )),
                    ),
                  ],
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
                background: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                    Theme.of(context).backgroundColor.withOpacity(0.5),
                    Theme.of(context).backgroundColor.withOpacity(0.1),
                    Colors.transparent,
                    Colors.transparent,
                  ],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.lighten,
              child: Image.asset(
                imageDashboardBg,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            )),
            centerTitle: false,
            title: Text(
              "Food Express",
              style: GoogleFonts.reenieBeanieTextTheme().headline1?.copyWith(
                  color: Colors.primaries.first,
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            titleSpacing: 16,
            expandedHeight: MediaQuery.of(context).size.shortestSide * 0.75,
            pinned: true,
            floating: false,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 130),
              child: FrostedBackgroundWidget(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                      left: 16, top: 16, bottom: 10, right: 16),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 25,
                            child: Text(
                              "Order Your Favorite Food.",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                color: Colors.grey.shade600
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "what do you want to order?",
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              clipBehavior: Clip.hardEdge,
                              color: Colors.transparent,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.filter_list_alt,
                                    size: 24,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                AlignedGridView.count(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  crossAxisCount: kIsWeb ? 6 : 2,
                  itemCount: 24,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      context.go("/home/restaurant", extra: "Vegan Resto");
                    },
                    child: const RestaurantCard(
                        name: "Vegan Resto",
                        duration: "12 mins",
                        imageUrl: rest),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
