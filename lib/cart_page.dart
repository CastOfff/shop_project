import 'package:flutter/material.dart';
import 'global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          
          return ListTile(
            onTap: () {

            },
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem['imageUrl'] as String ),
            ),
            trailing: IconButton(onPressed: () {

            }, icon: const Icon(
              Icons.delete,
              color: Colors.red,)),
            title: Text(cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size: ${cartItem['sizes'].toString()}'),
          );
        },
      ),
    );
  }
}
