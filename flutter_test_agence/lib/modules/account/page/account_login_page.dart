import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_test_agence/modules/account/cubit/account_cubit.dart';
import 'package:flutter_test_agence/modules/account/view/account_view.dart';
import 'package:flutter_test_agence/modules/account/widgets/social_login_widget.dart';
import 'package:flutter_test_agence/shared/models/user_model.dart';
import 'package:flutter_test_agence/shared/repositories/user_repository.dart';
import 'package:flutter_test_agence/shared/utils/routes.dart';
import 'package:flutter_test_agence/shared/widgets/load_page.dart';

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
          orElse: () => const LoadFullPage(),
        );
      },
    );
  }
}
