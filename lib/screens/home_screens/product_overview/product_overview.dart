import 'package:flutter/material.dart';
import 'package:google_first_app/utils/colors.dart';

enum SigninCharacter { fill, outline }

class ProductOverview extends StatefulWidget {

  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;

  const ProductOverview({super.key, required this.productName, required this.productImage, required this.productPrice,required this.productId});

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SigninCharacter _character = SigninCharacter.fill;
  Widget bottomNavigationBar({
    Color? iconColor,
    Color? backgroundColor,
    Color? color,
    String? title,
    IconData? iconData,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title!,
              style: TextStyle(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
            backgroundColor: textColor,
            color: Colors.white,
            iconColor: Colors.grey,
            title: "Add To WishList",
            iconData: Icons.favorite_outline,
          ),
          bottomNavigationBar(
            backgroundColor: primaryColor,
            color: textColor,
            iconColor: textColor,
            title: "Go To Cart",
            iconData: Icons.shop_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(
          color: textColor,
        ),
        title: Text(
          "Product Overview",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text("\$${widget.productPrice.toString()}"),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child: Image.network(
                       widget.productImage),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Available Options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: SigninCharacter.fill,
                              groupValue: _character,
                              onChanged: (value) {
                                setState(() {
                                  _character = value!;
                                });
                              },
                              activeColor: Colors.green[700],
                            )
                          ],
                        ),
                        Text("\$50"),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 20,
                                color: primaryColor,

                              ),
                              Text("ADD",style: TextStyle(
                                color: Colors.black,
                                
                                fontWeight: FontWeight.bold,
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About this product",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,

                ),),
                SizedBox(
                  height: 10,
                ),
               Text("Pazarlamada, bir ürün, bir müşterinin arzusunu veya ihtiyacını karşılamak için bir pazara sunulabilecek herhangi bir şeydir. Perakendecilikte ürünler, genellikle  olarak isimlendirilir. Ürün, yetiştirilen, yapılan ve bir yerden diğer bir yere taşınan şekillendirilmiş ticari eşyadır. Vikipedi",style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: textColor,

                ),),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
