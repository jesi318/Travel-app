import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel/cubit/app_cubits.dart';
import 'package:flutter_travel/pages/navpages/home_page.dart';
import 'package:flutter_travel/pages/welcome_page.dart';

import '../pages/detail_page.dart';
import 'app_cubit_states.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is WelcomeState) {
        return WelcomePage();
      }
      if (state is DetailState) {
        return DetailPage();
      }
      if (state is LoadedState) {
        return Homepage();
      }
      if (state is LoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container();
      }
    }));
  }
}
