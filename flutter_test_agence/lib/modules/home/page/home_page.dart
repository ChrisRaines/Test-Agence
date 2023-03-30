import 'package:flutter_test_agence/modules/home/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_agence/modules/home/view/home_view.dart';
import 'package:flutter_test_agence/shared/widgets/load_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().initial();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => const LoadFullPage(),
          loading: () => const LoadFullPage(),
          success: (user) => HomeView(user: user),
          error: () => const LoadFullPage(),
          orElse: () => const LoadFullPage(),
        );
      },
    );
  }
}
