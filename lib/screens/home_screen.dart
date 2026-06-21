import 'package:flutter/material.dart';
import 'package:start_once_again/widgets/logo_container.dart';
import 'package:start_once_again/widgets/premium_heading.dart';
import 'package:start_once_again/widgets/profile.dart';
import 'package:start_once_again/widgets/read_service_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _mainFadeController;
  late AnimationController _contentSlideController;
  late AnimationController _imageScaleController;
  late AnimationController _parallaxController;

  late Animation<double> _mainFadeAnimation;
  late Animation<Offset> _contentSlideAnimation;
  late Animation<double> _imageScaleAnimation;
  late Animation<double> _imageRotateAnimation;
  late Animation<double> _parallaxAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimationSequence();
  }

  void _initializeAnimations() {
    _mainFadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _contentSlideController = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    );

    _imageScaleController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );

    _parallaxController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..repeat(reverse: true);

    _mainFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _mainFadeController, curve: Curves.easeInCubic),
    );

    _contentSlideAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _contentSlideController,
            curve: Curves.easeOutCubic,
          ),
        );

    _imageScaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _imageScaleController, curve: Curves.elasticOut),
    );

    _imageRotateAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: _parallaxController, curve: Curves.easeInOut),
    );

    _parallaxAnimation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: _parallaxController, curve: Curves.easeInOut),
    );
  }

  void _startAnimationSequence() {
    _mainFadeController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _contentSlideController.forward();
      }
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        _imageScaleController.forward();
      }
    });
  }

  @override
  void dispose() {
    _mainFadeController.dispose();
    _contentSlideController.dispose();
    _imageScaleController.dispose();
    _parallaxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: FadeTransition(
        opacity: _mainFadeAnimation,
        child: Container(
          decoration: _buildGradientBackground(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Mobile & Tablet
              if (constraints.maxWidth < 1000) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        buildLeftContent(
                          _contentSlideAnimation,
                          _mainFadeAnimation,
                          _imageScaleAnimation,
                          context,
                        ),
                        const SizedBox(height: 40),

                        SizedBox(
                          height: 400,
                          child: buildRightImage(
                            _parallaxAnimation,
                            _imageRotateAnimation,
                            _imageScaleAnimation,
                            _mainFadeAnimation,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              // Desktop
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 40,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: buildLeftContent(
                        _contentSlideAnimation,
                        _mainFadeAnimation,
                        _imageScaleAnimation,
                        context,
                      ),
                    ),

                    const SizedBox(width: 40),

                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 500,
                        child: buildRightImage(
                          _parallaxAnimation,
                          _imageRotateAnimation,
                          _imageScaleAnimation,
                          _mainFadeAnimation,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildGradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [const Color(0xFF1A1F3A), const Color(0xFF0F1219)],
        stops: const [0.0, 1.0],
      ),
    );
  }

  Widget buildLeftContent(
    Animation<Offset> contentSlideAnimation,
    Animation<double> mainFadeAnimation,
    Animation<double> imageScaleAnimation,
    BuildContext context,
  ) {
    return SlideTransition(
      position: contentSlideAnimation,
      child: FadeTransition(
        opacity: mainFadeAnimation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildPremiumHeading(context, imageScaleAnimation),
            const SizedBox(height: 32),
            buildDescriptionText(mainFadeAnimation),
            const SizedBox(height: 48),
            buildButtonRow(),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow() {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        PremiumAnimatedButton(
          label: 'READ MORE',
          isPrimary: true,
          delay: const Duration(milliseconds: 900),
          vsync: this,
          onPressed: () {},
        ),
        PremiumAnimatedButton(
          label: 'OUR SERVICES',
          isPrimary: false,
          delay: const Duration(milliseconds: 1200),
          vsync: this,
          onPressed: () {},
        ),
      ],
    );
  }
}
