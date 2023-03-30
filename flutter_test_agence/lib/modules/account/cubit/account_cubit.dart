import 'package:bloc/bloc.dart';
import 'package:flutter_test_agence/shared/models/user_model.dart';
import 'package:flutter_test_agence/shared/repositories/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.dart';
part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState.initial());

  void initial() {
    emit(const AccountState.success());
  }

  void login(String name, String email, String image) async {
    emit(const AccountState.loading());
    UserRepository userRepository = UserRepository();
    await Future.delayed(const Duration(seconds: 2));

    UserModel user = UserModel(name: name, email: email, imageUrl: image);
    userRepository.saveUser(user);

    emit(const AccountState.successLogin());
  }
}
