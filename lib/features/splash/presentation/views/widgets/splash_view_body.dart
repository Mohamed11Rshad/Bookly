import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/widgets/faded_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key, required this.isFirstCall});
  final bool isFirstCall;

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    initFadeInAnimation(widget.isFirstCall);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  Widget buildTransition(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero, // Splash starts on screen
        end: const Offset(-1.0, 0.0), // Splash slides off-screen to the left
      ).animate(animation),
      child: const HomeView(), // Replace with const HomeView() if preferred
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedBuilder(
            animation: opacityAnimation,
            builder: (context, _) {
              return FadeTransition(
                opacity: opacityAnimation,
                child: Image.asset(AssetsData.logo),
              );
            }),
        const SizedBox(
          height: 4,
        ),
        FadedLogo(opacityAnimation: opacityAnimation),
      ],
    );
  }

  void initFadeInAnimation(bool isFirstAnimationCall) {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: isFirstAnimationCall ? 2 : 0),
    );

    opacityAnimation = Tween<double>(
      begin: 0.0, // Initially invisible
      end: 1.0, // Fully visible
    ).animate(animationController);

    animationController.forward();
  }
}
