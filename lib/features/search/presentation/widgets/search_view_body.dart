import 'package:bookly/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:flutter/cupertino.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomSearchTextField(),
        ],
      ),
    );
  }
}
