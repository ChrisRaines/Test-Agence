import 'package:bloc/bloc.dart';
import 'package:flutter_test_agence/shared/models/user_model.dart';
import 'package:flutter_test_agence/shared/repositories/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());
  late UserModel user;

  void initial() {
    UserRepository userRepository = UserRepository();
    emit(const HomeState.loading());
    userRepository.getUser().then(
      (value) {
        user = value;

        if (user.name != "") {
          emit(HomeState.success(user));
        } else {
          emit(HomeState.error());
        }
      },
    );
  }
}
