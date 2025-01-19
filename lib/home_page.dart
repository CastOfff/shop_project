import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
        body: SafeArea(
      //minimum: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Shoes\nCollection',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              Expanded(
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
                      selectedFilter = filter;
                      setState(() {});
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : Color.fromRGBO(245, 247, 249, 1),
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
          )
        ],
      ),
    ));
  }
}
