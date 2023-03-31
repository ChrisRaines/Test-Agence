import 'package:flutter/material.dart';
import 'package:flutter_test_agence/shared/constants/images_constants.dart';
import 'package:flutter_test_agence/shared/models/product_model/product_model.dart';
import 'package:flutter_test_agence/shared/models/user_model.dart';
import 'package:flutter_test_agence/shared/repositories/user_repository.dart';
import 'package:flutter_test_agence/shared/utils/routes.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.user,
    required this.productListMock,
  });

  final UserModel user;
  final List<ProductModel> productListMock;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserRepository userRepository = UserRepository();
  final ScrollController _scrollController = ScrollController();
  List<ProductModel> listProducts = [];

  @override
  void initState() {
    super.initState();
    // recebendo a lista de produtos mockada e a tornando modificavel
    listProducts = List.from(widget.productListMock);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  // para adicionar mais produtos na lista de produtos quando executar o scroll
  // como se fosse uma paginação
  _getMoreData() {
    ProductModel product = ProductModel(
      "Echo Dot (4ª Geração)",
      "R\$379,05",
      true,
    );

    for (int i = widget.productListMock.length;
        i < widget.productListMock.length + 10;
        i++) {
      listProducts.add(product);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: _drawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 104, 90, 86),
        title: const Text("Produtos"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GridView.builder(
          controller: _scrollController,
          itemCount: listProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            ProductModel productIndex = listProducts[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.product),
              child: _productWidget(
                productIndex.nameProduct,
                productIndex.priceProduct,
                productIndex.inStock,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: widget.user.imageUrl != null && widget.user.imageUrl != ""
                  ? Image.network(
                      widget.user.imageUrl!,
                      scale: 0.60,
                    )
                  : Image.asset(
                      ImagesConstants.userDefault,
                      height: 200,
                      width: 200,
                    ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.user.name ?? "Bem vindo!",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 20),
            _itemMenu(
              "Perfil",
              const Icon(
                Icons.person,
                size: 29,
              ),
              () {},
            ),
            const SizedBox(height: 20),
            _itemMenu(
              "Meus produtos",
              const Icon(
                Icons.shopping_bag_rounded,
                size: 29,
              ),
              () {},
            ),
            const SizedBox(height: 20),
            _itemMenu(
              "Configurações",
              const Icon(
                Icons.settings,
                size: 29,
              ),
              () {},
            ),
            const SizedBox(height: 20),
            _itemMenu(
              "Logout",
              const Icon(
                Icons.logout_rounded,
                size: 29,
              ),
              () {
                userRepository.logoff();
                Navigator.pushNamed(context, Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemMenu(String title, Icon icon, void Function()? func) {
    return GestureDetector(
      onTap: func,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 20),
              icon,
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget _productWidget(String name, String price, bool inStock) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagesConstants.produto, scale: 8),
          const SizedBox(height: 8.0),
          const Text("Echo Dot (4ª Geração)"),
          const SizedBox(height: 8.0),
          const Text(
            "R\$379,05",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          const Text(
            "Em estoque",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
          )
        ],
      ),
      // child: Text("1"),
    );
  }
}
