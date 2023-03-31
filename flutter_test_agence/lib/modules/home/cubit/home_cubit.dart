import 'package:bloc/bloc.dart';
import 'package:flutter_test_agence/shared/models/product_model/product_model.dart';
import 'package:flutter_test_agence/shared/models/user_model.dart';
import 'package:flutter_test_agence/shared/repositories/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());
  late UserModel user;

  // Lista de produtos mockada
  // para ser enviada como se fosse o resultado de uma chamada de endpoint
  List<ProductModel> listProductMock = [
    ProductModel("Echo Dot (4ª Geração)", "R\$379,05", true),
    ProductModel("Echo Dot (4ª Geração)", "R\$379,05", true),
    ProductModel("Echo Dot (4ª Geração)", "R\$379,05", true),
    ProductModel("Echo Dot (4ª Geração)", "R\$379,05", true),
    ProductModel("Echo Dot (4ª Geração)", "R\$379,05", true),
    ProductModel("Echo Dot (4ª Geração)", "R\$379,05", true),
    ProductModel("Echo Dot (4ª Geração)", "R\$379,05", true),
    ProductModel("Echo Dot (4ª Geração)", "R\$379,05", true),
    ProductModel("Echo Dot (4ª Geração)", "R\$379,05", true),
    ProductModel("Echo Dot (4ª Geração)", "R\$379,05", true),
  ];

  void initial() {
    UserRepository userRepository = UserRepository();
    emit(const HomeState.loading());
    userRepository.getUser().then(
      (value) {
        user = value;

        if (user.name != "") {
          emit(HomeState.success(user, listProductMock));
        } else {
          emit(const HomeState.error());
        }
      },
    );
  }
}
