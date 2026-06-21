import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_once_again/controllers/nav_provider.dart';

class NavItem extends StatefulWidget {
  final String label;

  const NavItem({super.key, required this.label});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> with SingleTickerProviderStateMixin {
  late AnimationController _underlineController;

  @override
  void initState() {
    super.initState();
    _underlineController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _underlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<NavProvider>(context, listen: false);
    return Consumer<NavProvider>(
      builder: (context, navPro, child) => MouseRegion(
        onEnter: (_) {
          _underlineController.forward();
        },
        onExit: (_) {
          navPro.setHover(false);
          _underlineController.reverse();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              ScaleTransition(
                scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _underlineController,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: Container(
                  height: 2.5,
                  width: 30,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue[400]!, Colors.cyan],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
