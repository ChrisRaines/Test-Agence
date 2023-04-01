import 'package:flutter/material.dart';
import 'package:flutter_test_agence/modules/product_detail/widgets/modal_confirmation_buy_product.dart';
import 'package:flutter_test_agence/shared/constants/images_constants.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  void playSnackBar() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        content: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 70,
          child: const Text(
            "Produto adicionado a suas compras",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.shopping_cart_checkout_sharp),
          SizedBox(width: 16)
        ],
        backgroundColor: const Color.fromARGB(255, 104, 90, 86),
        title: const Text("Echo Dot (4ª Geração)"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.keyboard_arrow_left)),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
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
              Row(
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
                      SizedBox(height: 12),
                      SizedBox(
                        width: 190,
                        child: Text(
                            "Conheça o Echo Dot (4ª Geração): nosso smart speaker com Alexa de maior sucesso ainda melhor. O novo design de áudio com direcionamento frontal, garante mais graves e um som completo."),
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
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.green),
                        ),
                        onPressed: () {
                          ModalConfirmationBuyProduct()
                              .modalBottomSheet(context, playSnackBar);
                        },
                        child: const Text("Comprar agora"),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    "Controle a sua casa inteligente por voz",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImagesConstants.productMoreDetails,
                        scale: 2,
                      )
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Gerencie dispositivos de casa inteligente compatíveis usando sua voz. Ligue o abajur antes de sair da cama, ligue a cafeteira a caminho da cozinha ou diminua as luzes sentado no sofá para assistir a um filme, tudo sem levantar um dedo.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
