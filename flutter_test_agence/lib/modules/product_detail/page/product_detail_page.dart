import 'package:flutter/material.dart';
import 'package:flutter_test_agence/shared/constants/images_constants.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.shopping_cart_checkout_sharp),
          SizedBox(width: 16)
        ],
        backgroundColor: const Color.fromARGB(255, 0, 57, 104),
        title: const Text("Echo Dot (4ª Geração)"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.keyboard_arrow_left)),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Image.asset(ImagesConstants.maps),
            Row(
              children: const [
                Text("Ver no mapa",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: const [
                      SizedBox(height: 30),
                      SizedBox(
                        width: 190,
                        child: Text(
                          "Echo Dot (4ª Geração): Smart Speaker com Alexa | Música, informação e Casa Inteligente - Cor Preta",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        ImagesConstants.produto,
                        scale: 5,
                      ),
                      const SizedBox(height: 10.0),
                      Image.asset(
                        ImagesConstants.stars,
                        scale: 9,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        "R\$379,05",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Em estoque",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
