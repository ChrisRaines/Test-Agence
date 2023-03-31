import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_test_agence/modules/account/cubit/account_cubit.dart';
import 'package:flutter_test_agence/modules/account/widgets/social_login_widget.dart';
import 'package:flutter_test_agence/shared/constants/images_constants.dart';
import 'package:flutter_test_agence/shared/repositories/user_repository.dart';
import 'package:flutter_test_agence/shared/utils/routes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  UserRepository userRepository = UserRepository();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((event) {
      setState(() {
        _currentUser = event;
      });
    });

    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    //  GoogleSignInAccount? user = _currentUser;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Image.asset(ImagesConstants.logo),
            const SizedBox(height: 35),
            Row(
              children: const [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: "E-mail",
                suffixIcon: Icon(
                  Icons.email_outlined,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: "Senha",
                suffixIcon: Icon(
                  Icons.remove_red_eye_sharp,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Esqueci minha senha",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.home),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 104, 90, 86),
                    borderRadius: BorderRadius.circular(30)),
                width: 300,
                height: 50,
                child: const Text(
                  "Entrar",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(children: const [
              Text(
                "Ou entrar com:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
            const SizedBox(height: 8),
            SocialLoginComponent(
              facebook: () async {
                final fb = FacebookLogin();

                final res = await fb.logIn(permissions: [
                  FacebookPermission.publicProfile,
                  FacebookPermission.email,
                ]);

                switch (res.status) {
                  case FacebookLoginStatus.success:
                    // final FacebookAccessToken? accessToken = res.accessToken;
                    final profile = await fb.getUserProfile();
                    final imageUrl = await fb.getProfileImageUrl(width: 100);
                    final email = await fb.getUserEmail();

                    Provider.of<AccountCubit>(context, listen: false)
                        .login(profile!.name!, email!, imageUrl!);

                    break;
                  case FacebookLoginStatus.cancel:
                    break;
                  case FacebookLoginStatus.error:
                    print('Error while log in: ${res.error}');
                    break;
                }
              },
              google: () async {
                try {
                  await _googleSignIn.signIn();
                  Provider.of<AccountCubit>(context, listen: false).login(
                    _currentUser?.displayName ?? "",
                    _currentUser?.email ?? "",
                    _currentUser?.photoUrl ?? "",
                  );
                } catch (e) {
                  print("Error signing in $e");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
