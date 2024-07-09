import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/functions.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/utils/simple_bloc_obsrver.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/best_seller_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kBestSellerBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}



class Bookly extends StatefulWidget {
  const Bookly({super.key});

  @override
  State<Bookly> createState() => _BooklyState();
}

class _BooklyState extends State<Bookly> {
  @override
  void dispose() {
    deleteAllExceptLatest10(kBestSellerBox);
    deleteAllExceptLatest10(kFeaturedBox);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => BestSellerBooksCubit(
            BestSellerBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          )..fetchBestSellerBooks(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        home: SplashView(),
      ),
    );
  }
}
