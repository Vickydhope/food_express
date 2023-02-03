import 'package:flutter/material.dart';
import 'package:food_express/res/drawables.dart';
import 'package:food_express/widgets/expandable_text.dart';

class DishDetailsPage extends StatefulWidget {
  DishDetailsPage({Key? key}) : super(key: key);

  @override
  State<DishDetailsPage> createState() => _DishDetailsPageState();
}

class _DishDetailsPageState extends State<DishDetailsPage> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              elevation: 0,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  print(top);
                  return LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    // print('constraints=' + constraints.toString());
                    top = constraints.biggest.height;

                    return FlexibleSpaceBar(
                        centerTitle: false,
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 31),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: top ==
                                    MediaQuery.of(context).padding.top +
                                        kToolbarHeight +
                                        31
                                ? 1.0
                                : 0.0,
                            // opacity: 1.0,
                            child: Text(
                              "Onion Pizza",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ),
                        background: Image.asset(
                          productImage,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                        ));
                  });
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
                                fontSize: 20,
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
                              ?.copyWith(color: Colors.grey.shade400),
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
                          "4.8 Rating",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const ExpandableTextWidgets(
                        text:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus at ultrices mi tempus imperdiet nulla malesuada pellentesque. Posuere lorem ipsum dolor sit amet consectetur. Vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus at ultrices mi tempus imperdipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus at ultrices mi tempus imperdiet nulla malesuada pellentesque. Posuere lorem ipsum dolor sit amet consectetur. Vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus at ultrices mi tempus imperdiet nulla malesuada pellentesque. Posuere lorem ipsum dolor sit amet consectetur. Vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus at ultrices mi tempus imperdipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus at ultrices mi tempus imperdiet nulla malesuada pellentesque. Posuere lorem ipsum dolor sit amet consectetur. Vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere.")
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
