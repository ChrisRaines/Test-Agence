import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadFullPage extends StatelessWidget {
  const LoadFullPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('loadPage'),
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.red,
          statusBarIconBrightness: Brightness.dark,
        ),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
