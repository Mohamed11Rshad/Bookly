import 'package:bookly/core/utils/functions.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksActionsButton extends StatelessWidget {
  final num price;
  final String? url;
  const BooksActionsButton({
    super.key,
    required this.price,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {},
              text: price != 0 ? "$price €" : 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: url == null
                  ? null
                  : () {
                      launchCustomUrl(url!);
                    },
              text: 'Preview',
              backgroundColor: url == null
                  ? const Color(0xffEf8262).withOpacity(0.3)
                  : const Color(0xffEf8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              textStyle: Styles.textStyle16.copyWith(
                color: url == null ? Colors.white24 : Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
