import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NoneWidget extends StatelessWidget {
  const NoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Center(
        child: Text(
          'None',
          style: Styles.textStyle20.copyWith(color: Colors.white38),
        ),
      ),
    );
  }
}
