import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:store/utils/colors.dart';
import 'package:store/view/seller/inventory/inventory_screen.dart';
import 'package:store/view/seller/monitor/monitor_screen.dart';

class SellerNavbarScreen extends StatefulWidget {
  const SellerNavbarScreen({super.key});

  @override
  State<SellerNavbarScreen> createState() => _SellerNavbarScreenState();
}

class _SellerNavbarScreenState extends State<SellerNavbarScreen> {
  int index = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> _pages = [
    InventoryScreen(),
    MonitorScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: index,
        items: const <Widget>[
          Icon(Icons.inventory_2_outlined, size: 25),
          Icon(Icons.bar_chart_outlined, size: 24),
        ],
        color: Colors.white,
        backgroundColor: appBarGradientColor[0], // Replace with a single color
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        letIndexChange: (index) => true,
      ),
      backgroundColor: white,
    );
  }
}

