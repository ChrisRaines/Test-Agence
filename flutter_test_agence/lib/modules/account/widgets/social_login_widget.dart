import 'package:flutter/material.dart';
import 'package:flutter_test_agence/shared/constants/images_constants.dart';

class SocialLoginComponent extends StatelessWidget {
  const SocialLoginComponent({
    Key? key,
    this.facebook,
    this.google,
    this.child,
  }) : super(key: key);

  final void Function()? facebook;
  final void Function()? google;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(children: [
          _cardLogin(
            const Color(0xFF3b5998),
            ImagesConstants.iconFacebook,
            facebook ?? () {},
          ),
          _cardLogin(
            Colors.white,
            ImagesConstants.iconGoogle,
            google ?? () {},
            colorBorder: Colors.grey,
          ),
        ]),
      ],
    );
  }

  Widget _cardLogin(Color color, String icon, void Function()? onPress,
          {Color colorBorder = Colors.transparent}) =>
      InkWell(
        onTap: onPress,
        child: Container(
          width: 53,
          height: 44,
          margin: const EdgeInsets.only(right: 7),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(width: 1, color: colorBorder)),
          child: Center(
            child: Image.asset(
              icon,
            ),
          ),
        ),
      );
}
