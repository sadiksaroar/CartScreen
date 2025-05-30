import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartScreen(),
    );
  }
}
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final List<CartItem> cartItems = [
    CartItem(
      image: 'cartScreen/Image (3).png',
      title: 'Makhana Everything Bagels',
      color: 'Berown',
      price: 67.00,
    ),
    CartItem(
      image: 'cartScreen/Image (4).png',
      title: 'Chicken Munch Edition 229',
      color: 'Berown',
      price: 26.00,
    ),
    CartItem(
      image: 'cartScreen/Image (5).png',
      title: 'Forest Limited Edition 229',
      color: 'Berown',
      price: 32.00,
    ),
    CartItem(
      image: 'cartScreen/Link → 3-500x500.jpg 1.png',
      title: 'Oatmeal Raising 319',
      color: 'Berown',
      price: 24.00,
    ),
  ];
  final Map<int, bool> checkedItems = {};



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
        title: Text("MY Cart"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag_outlined))
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return CartItemWidget(
            cartItem: cartItems[index],
            isChecked: checkedItems[index] ?? false,
            onChecked: (value) {
              setState(() {
                checkedItems[index] = value;
              });
            },
          );
        },
      ),
    );
  }
}

class CartItem {
  final String image;
  final String title;
  final String color;
  final double price;

  CartItem ({
    required this.image,
  required this.title,
  required this.color,
  required this.price,


});
  
}
class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final bool isChecked;
  final Function(bool) onChecked;

  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.isChecked,
    required this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) => onChecked(value ?? false),
            ),
            Image.asset(cartItem.image, width: 50, height: 50, fit: BoxFit.cover),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Color: ${cartItem.color}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {},
                          ),
                          const Text('1', style: TextStyle(fontSize: 16)),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Text(
                        '\$${cartItem.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}