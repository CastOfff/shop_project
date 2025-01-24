import 'package:flutter/material.dart';
import 'package:shop_project/widget/product_card.dart';
import 'package:shop_project/page/product_details_page.dart';

import '../global_variables.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
        borderSide: BorderSide(color: Colors.black12));
    return SafeArea(
      //minimum: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      filled: true,
                      fillColor: Colors.white,
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border),
                ),
              )
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1)),
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      padding: const EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //       builder: (context) {
                    //         return ProductDetailsPage(
                    //           product: product,
                    //         );
                    //       }
                    //   )
                    // );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: product),
                        ));
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromRGBO(245, 247, 249, 1.0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
