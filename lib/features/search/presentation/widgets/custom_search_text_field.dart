import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (key) {
        if (key.isNotEmpty) {
          BlocProvider.of<SearchCubit>(context)
              .fetchSearchResultBooks(searchKey: key);
        } else {
          BlocProvider.of<SearchCubit>(context).emit(
            SearchInitial(),
          );
        }
      },
      decoration: InputDecoration(
          enabledBorder: buildOutlinedInputBorder(),
          focusedBorder: buildOutlinedInputBorder(
            borderColor: Colors.white,
          ),
          hintText: 'Search',
          suffixIcon: const IconButton(
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Color.fromARGB(179, 7, 4, 4),
              size: 22,
            ),
            onPressed: null,
          )),
    );
  }

  OutlineInputBorder buildOutlinedInputBorder({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: borderColor ?? Colors.white54,
      ),
    );
  }
}
