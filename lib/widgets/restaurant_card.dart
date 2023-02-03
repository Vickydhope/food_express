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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 12, left: 16, right: 16, top: 16),
              child: Column(
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    duration,
                    textAlign: TextAlign.center,
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
      ),
    );
  }
}
