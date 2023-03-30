import 'package:flutter/material.dart';
import 'package:flutter_test_agence/shared/utils/routes.dart';

class SuccessLoginPage extends StatelessWidget {
  const SuccessLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline_outlined,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 10),
            const Text(
              "Logado com sucesso!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.home),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.green,
                  ),
                  width: 100,
                  height: 45,
                  child: const Text(
                    "ok",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
