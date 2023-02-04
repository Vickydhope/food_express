import 'package:flutter/material.dart';
import 'package:food_express/res/drawables.dart';
import 'package:food_express/widgets/product_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            titleSpacing: 0,
            elevation: 0,
            expandedHeight: MediaQuery.of(context).size.shortestSide * 0.8,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                top = constraints.biggest.height;

                return FlexibleSpaceBar(
                    expandedTitleScale: 1.0,
                    titlePadding: const EdgeInsets.only(left: 16, bottom: 31),
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
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(profilePic),
                            radius: kToolbarHeight / 2.5,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Text(
                              "Brooklyn Simmons",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    background: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: [
                            Theme.of(context).backgroundColor.withOpacity(0.7),
                            Theme.of(context).backgroundColor.withOpacity(0.6),
                            Theme.of(context).backgroundColor.withOpacity(0.1),
                            Colors.transparent,
                            Colors.transparent,
                          ],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.lighten,
                      child: Image.asset(
                        profilePic,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                    ));
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.amber.withOpacity(0.4)),
                        child: const Text(
                          "Popular",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Brooklyn Simmons",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(fontSize: 24),
                        ),
                      ),
                      IconButton(
                          splashRadius: 24,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.redAccent,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "brooklyn.simmons@gmail.com",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.grey.shade400),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Favorite",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ProductCard(),
                  const Text(
                    "Lorem Ipsum delor dummmy text Quick brown fox jumps over the lazy dog",
                    style: TextStyle(fontSize: 100),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
