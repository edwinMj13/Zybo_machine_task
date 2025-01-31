import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo_task/config/routes/route_names.dart';
import 'package:zybo_task/config/routes/routes.dart';
import 'package:zybo_task/features/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:zybo_task/features/presentation/pages/login_page/bloc/login_bloc.dart';
import 'package:zybo_task/features/presentation/pages/login_page/login_page.dart';
import 'package:zybo_task/features/presentation/pages/profile_page/bloc/profile_bloc.dart';
import 'package:zybo_task/features/presentation/pages/search_results_page/bloc/search_results_page_bloc.dart';
import 'package:zybo_task/features/presentation/pages/wishlist_page/bloc/wishlist_bloc.dart';

import 'features/presentation/pages/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginBloc()),
        BlocProvider(create: (context)=>HomeBloc()),
        BlocProvider(create: (context)=>ProfileBloc()),
        BlocProvider(create: (context)=>SearchResultsPageBloc()),
        BlocProvider(create: (context)=>WishlistBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: RouteNames.splashPage,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}

