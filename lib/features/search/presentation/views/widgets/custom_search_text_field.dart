import 'dart:async';

import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (key) {
        if (_debounce?.isActive ?? false) _debounce?.cancel();

        _debounce = Timer(const Duration(milliseconds: 500), () {
          if (key.isNotEmpty) {
            BlocProvider.of<SearchCubit>(context)
                .fetchSearchResultBooks(searchKey: key);
          } else {
            BlocProvider.of<SearchCubit>(context).emitSearchInitialState();
          }
        });
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
