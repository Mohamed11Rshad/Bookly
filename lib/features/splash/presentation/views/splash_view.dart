import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatefulWidget {
  SplashView({super.key});
  bool firstCall = true;
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToHomeView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(
        isFirstCall: widget.firstCall,
      ),
    );
  }

  void navigateToHomeView() {
    if (widget.firstCall) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: const HomeView(),
            duration: kTransitionDuration,
            type: PageTransitionType.rightToLeftJoined,
            childCurrent: widget,
          ),
        );
        widget.firstCall = false;
      });
    }
  }
}
