

import 'package:flutter/material.dart';

import 'package:flutterdart10/components/my_button.dart';
import 'package:flutterdart10/components/my_drawer.dart';
import 'package:flutterdart10/models/product.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemfromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text("Deseja remover esse item do carrinho"),
          actions: [
            MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("cancelar")),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<Shop>().removeFromCart(product);
              },
              child: const Text("Confirmar"),
            )
          ]),
    ); 
  }
void addItemToCart(BuildContext context, Product product){
    context.read<Shop>().incrementQuantity(product);
  }
  void decreaseItemToCart(BuildContext context, Product product){
    context.read<Shop>().decremidadeQuantity(product);
  }
  
void payButtonPressed(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => const AlertDialog(
          content:
              Text("logo conectarmos esse app a uma solução de pagamento")));

}

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;


double totalBill = cart.fold<double>(
0,((previousValue, element) => previousValue + (element.totalPrice)));




    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("carrinho"),
        ),
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Expanded( 
              child: cart.isEmpty
                  ? const Center(child: Text("seu carrinho esta vazio "))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];

                        return ListTile(
                          leading: Image.network(item.imagePath),
                            title: Text(item.name),
                            subtitle: Text(item.price.toStringAsFixed(2)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.restore_from_trash_rounded),
                                  onPressed: () => removeItemfromCart(context,item),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: item.quantity >= 2
                                  ? () => decreaseItemToCart(context, item)
                                  : () => removeItemfromCart(context, item)
                                     
                                ),
                                Text(item.quantity.toString()),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () => addItemToCart(context, item),
                                )
                              ], 
                            ));
                      }),
            ),


             Visibility(
              visible: cart.isNotEmpty,
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("total R\$ ${totalBill.toStringAsFixed(2)}", style: TextStyle( fontWeight:FontWeight.bold, fontSize: 18 )),
                          MyButton(
                              onTap: () => payButtonPressed(context),
                              child: const Text("Pagamentos")),
                        ],
                      ))),
            )
          ], ));
  }
}
