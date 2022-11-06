import 'package:flutter/material.dart';
import 'package:google_first_app/provider/product_provider.dart';

import 'package:google_first_app/screens/home_screens/drawer_side.dart';
import 'package:google_first_app/screens/home_screens/single_product.dart';
import 'package:google_first_app/screens/search/search.dart';
import 'package:google_first_app/utils/colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;
  @override
  void initState() {
    // TODO: implement initState
    ProductProvider productProvider = Provider.of(
      context,
      listen: false,
    );
    productProvider.fetchHerbsProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(
      context,
    );
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      drawer: DrawerSide(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xffd6b738),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: Color(0xffd4d181),
              radius: 16,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getHerbProductDataList,
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                  size: 20,
                ),
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 16,
              child: Icon(
                Icons.shop,
                size: 20,
                color: Colors.black,
              ),
              backgroundColor: Color(0xffd4d181),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          // BAnner

          Padding(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            child: Column(
              children: [
                //BAANNER

                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/premium-photo/food-set-fresh-vegetables-fruits-black-stone-background-organic-food-top-view-free-space-your-text_187166-22341.jpg?w=2000"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 110,
                                    bottom: 10,
                                  ),
                                  child: Container(
                                    height: 50,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Color(0xffd6b738),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(50),
                                          bottomLeft: Radius.circular(50),
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 18),
                                      child: Text(
                                        "Vegi",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            shadows: [
                                              BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.green.shade900,
                                                offset: Offset(3, 3),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "30% Off",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            shadows: [
                                              BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.green.shade900,
                                                offset: Offset(3, 3),
                                              )
                                            ]),
                                      ),
                                      Text(
                                        "On all vegatables products",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            shadows: [
                                              BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.green.shade900,
                                                offset: Offset(3, 3),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ),
                //BASLIK
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Herbs Seasonings",
                        style: TextStyle(),
                      ),
                      TextButton(onPressed: () {}, child: Text("View All")),
                    ],
                  ),
                ),
                //PRODUCT

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SingleProduct(),
                      
                    ],
                  ),
                ),
                // BASLİK 2
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fresh Fruits",
                        style: TextStyle(),
                      ),
                      TextButton(onPressed: () {}, child: Text("View All")),
                    ],
                  ),
                ),

                // FRUİTS PRODUCT

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SingleProduct(),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
