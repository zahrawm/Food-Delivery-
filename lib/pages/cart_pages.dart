import 'package:flutter/material.dart';
import 'package:food_delivery/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: value.cartItems.isEmpty
                    ? const Center(
                        child: Text(
                          "Your cart is empty!",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      )
                    : ListView.builder(
                        itemCount: value.cartItems.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(12),
                              title: Text(
                                value.cartItems[index][0], // Item name
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "\$${value.cartItems[index][1]}", // Price
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.green),
                              ),
                              leading: Image.asset(
                                value.cartItems[index][2], // Image
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.remove_circle,
                                    color: Colors.red),
                                onPressed: () {
                                  value.removeItemFromCart(index);
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$${value.calculateTotal()}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      // Implement payment logic here
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pay Now",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
