import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_once_again/controllers/nav_provider.dart';

class PremiumAnimatedButton extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final Duration delay;
  final VoidCallback onPressed;
  final TickerProvider vsync;

  const PremiumAnimatedButton({
    super.key,
    required this.label,
    required this.isPrimary,
    required this.delay,
    required this.onPressed,
    required this.vsync,
  });

  @override
  State<PremiumAnimatedButton> createState() => PremiumAnimatedButtonState();
}

class PremiumAnimatedButtonState extends State<PremiumAnimatedButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _hoverScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _hoverScale = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOutCubic),
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _hoverController.dispose();
    super.dispose();
  }

  void _onHoverEnter(bool isHovered, NavProvider navPro) {
    if (!isHovered) {
      navPro.setHover(true);
      _hoverController.forward();
    }
  }

  void _onHoverExit(bool isHovered, NavProvider navPro) {
    if (isHovered) {
      navPro.setHover(false);
      _hoverController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<NavProvider>(context, listen: false);
    return ScaleTransition(
      scale: _scaleAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Consumer<NavProvider>(
          builder: (context, navPro, child) => MouseRegion(
            onEnter: (_) => _onHoverEnter(navPro.isHovered, navPro),
            onExit: (_) => _onHoverExit(navPro.isHovered, navPro),
            child: ScaleTransition(
              scale: _hoverScale,
              child: _buildButton(navPro.isHovered),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(bool isHovered) {
    if (widget.isPrimary) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.withValues(alpha: isHovered ? 0.6 : 0.3),
              blurRadius: isHovered ? 20 : 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 14, 34, 51),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: isHovered ? 16 : 8,
          ),
          onPressed: widget.onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(width: 12),
              Transform.translate(
                offset: Offset(isHovered ? 6 : 0, 0),
                child: const Text('→', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withValues(alpha: isHovered ? 0.2 : 0.05),
              blurRadius: isHovered ? 20 : 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: BorderSide(color: Colors.white, width: isHovered ? 2.5 : 2),
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: widget.onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(width: 12),
              Transform.translate(
                offset: Offset(isHovered ? 6 : 0, 0),
                child: const Text('→', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      );
    }
  }
}
