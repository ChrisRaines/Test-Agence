import 'package:flutter_test_agence/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const userName = 'name_user';
const userEmail = 'email_user';
const userImage = 'image_user';

class UserRepository {
  late SharedPreferences sharedPreferences;

  Future<UserModel> getUser() async {
    sharedPreferences = await SharedPreferences.getInstance();

    final name = sharedPreferences.getString(userName);
    final email = sharedPreferences.getString(userEmail);
    final image = sharedPreferences.getString(userImage);

    return UserModel(name: name, email: email, imageUrl: image);
  }

  void saveUser(UserModel user) async {
    sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString(userName, user.name ?? "");
    sharedPreferences.setString(userEmail, user.email ?? "");
    sharedPreferences.setString(userImage, user.imageUrl ?? "");
  }
}
