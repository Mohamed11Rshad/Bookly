import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/search/domain/repos/search_repo_impl.dart';
import 'package:bookly/features/search/domain/use_cases/search_use_case.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        searchUseCase: SearchUseCase(searchRepo: getIt.get<SearchRepoImpl>(),),
      ),
      child: const Scaffold(
        body: SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
