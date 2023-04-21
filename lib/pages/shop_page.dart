import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coffee.dart';
import '../models/coffee_shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add to cart
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    // let user know item has been added to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.brown.shade200,
        title: Center(
          child: Text('Item Added to Cart!'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // heading  message
              const Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 25),

              // list of coffees to buy
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    // get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];

                    // return the tile for this coffee
                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: Icon(Icons.add),
                      onPressed: () => addToCart(eachCoffee),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
