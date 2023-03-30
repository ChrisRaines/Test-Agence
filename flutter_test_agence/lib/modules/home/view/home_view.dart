import 'package:flutter/material.dart';
import 'package:flutter_test_agence/shared/constants/images_constants.dart';
import 'package:flutter_test_agence/shared/models/user_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: _drawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 57, 104),
        title: const Text("Test Agence"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 5,
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: widget.user.imageUrl != null && widget.user.imageUrl != ""
                ? Image.network(widget.user.imageUrl!)
                : Image.asset(ImagesConstants.userDefault),
          ),
          const SizedBox(height: 20),
          Text(
            widget.user.name!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )
        ]),
      ),
    );
  }
}
