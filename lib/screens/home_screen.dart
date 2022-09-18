import 'package:flutter/material.dart';
import 'package:products_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../services/auth_service.dart';
import '../services/products_service.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     final productsService = Provider.of<ProductsService>(context);
     final authService = Provider.of<AuthService>(context, listen: false);
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Products')),
        actions:  [
          TextButton(onPressed: () {
            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');
          } , child: Icon(Icons.login_outlined, color: Colors.white,))
          
        ],
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: (){
            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(
            product: productsService.products[index],),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {

          productsService.selectedProduct =  Product(
            available: false, 
            name: '', 
            price: 0
          );
          Navigator.pushNamed(context, 'product');
        },
      ),
   );
  }
}