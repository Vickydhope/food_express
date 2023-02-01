import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _buildBottomBar(),
      body: Stack(
        children: [const ScreenBackground(), widget.child],
      ),
    );
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      showElevation: true,
      itemCornerRadius: 8,
      backgroundColor: const Color(0xFF242323),
      curve: Curves.easeOut,
      containerHeight: 65,
      selectedIndex: _calculateSelectedIndex(context),
      onItemSelected: onTap,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.home_rounded),
          title: const Text(
            'Home',
            overflow: TextOverflow.ellipsis,
          ),
          inactiveColor: Colors.redAccent,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.person),
          title: const Text('Account'),
          inactiveColor: Colors.redAccent,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          showBadge: true,
          icon: const Icon(Icons.shopping_cart_rounded),
          title: const Text(
            'Cart ',
          ),
          inactiveColor: Colors.redAccent,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          showBadge: true,
          icon: const Icon(Icons.message_rounded),
          title: const Text('Messages'),
          inactiveColor: Colors.redAccent,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/account')) {
      return 1;
    }
    if (location.startsWith('/cart')) {
      return 2;
    }
    if (location.startsWith('/messages')) {
      return 3;
    }
    return 0;
  }

  void onTap(int value) {
    switch (value) {
      case 0:
        return context.go('/home');
      case 1:
        return context.go('/account');
      case 2:
        return context.go('/cart');
      case 3:
        return context.go('/messages');
      default:
        return context.go('/home');
    }
  }
}
