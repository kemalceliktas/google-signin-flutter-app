import 'package:flutter/material.dart';
import 'package:google_first_app/models/product_modal.dart';
import 'package:google_first_app/widgets/single_item.dart';
import 'package:google_first_app/utils/colors.dart';

class Search extends StatefulWidget {
  const Search({
    super.key,
    required this.search,
  });
  final List<ProductModal> search;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";
  searchItem(String query) {
    List<ProductModal> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModal> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Search",
          style: TextStyle(color: textColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text("Items"),
              ),
              Container(
                height: 52,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      query = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color(0xffc2c2c2),
                    filled: true,
                    hintText: "Search for items in the store",
                    suffixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: _searchItem.map((e) {
                  return SingleItem(
                    isBool: true,
                    productImage: e.productImage,
                    productName: e.productName,
                    productPrice: e.productPrice,
                    productId: e.productId,
                    productQuantity: 1,
                    delete: (){},
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
