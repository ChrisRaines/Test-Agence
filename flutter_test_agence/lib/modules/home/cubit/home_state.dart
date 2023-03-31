part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.success(
      UserModel user, List<ProductModel> productListMock) = _Success;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.error() = _Error;
}
