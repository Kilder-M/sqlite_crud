import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rv_crud_challenger/app/data/domain/entities/product.dart';
import 'package:rv_crud_challenger/app/modules/home/controllers/home_controller.dart';
import 'package:rv_crud_challenger/app/modules/home/views/update_view.dart';

AlertDialog alertDialogProduct(
    BuildContext context, HomeController _controller, Product product) {
  return AlertDialog(
    title: const Text(
      'O que deseja fazer ?',
    ),
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
          _controller.goToForm(product);
        },
        child: const Text('Editar'),
      ),
      TextButton(
        onPressed: () {
          Get.back();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                'Você Tem certeza ?',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _controller.remove(product.id!);
                    Get.back();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: const Text(
                          'Produto deletado ! ',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Sim'),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Não'),
                ),
              ],
            ),
          );
        },
        child: const Text('Excluir'),
      ),
    ],
  );
}