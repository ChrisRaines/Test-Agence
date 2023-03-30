import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_agence/modules/account/cubit/account_cubit.dart';
import 'package:flutter_test_agence/modules/account/view/account_view.dart';
import 'package:flutter_test_agence/shared/widgets/load_page.dart';
import 'package:flutter_test_agence/shared/widgets/success_login.dart';

class AccountLoginPage extends StatefulWidget {
  const AccountLoginPage({super.key});

  @override
  State<AccountLoginPage> createState() => _AccountLoginPageState();
}

class _AccountLoginPageState extends State<AccountLoginPage> {
  @override
  void initState() {
    super.initState();
    context.read<AccountCubit>().initial();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => const LoadFullPage(),
          success: () => const AccountView(),
          loading: () => const LoadFullPage(),
          successLogin: () => const SuccessLoginPage(),
          orElse: () => const LoadFullPage(),
        );
      },
    );
  }
}
