import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.duration})
      : super(key: key);

  final String name;
  final String duration;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.contain,
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 4),
            child: Column(
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  duration,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey.shade400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
