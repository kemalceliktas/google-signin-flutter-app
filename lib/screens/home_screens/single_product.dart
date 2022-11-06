import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_first_app/screens/home_screens/product_overview/product_overview.dart';
import 'package:google_first_app/widgets/count.dart';
import 'package:provider/provider.dart';

import '../../provider/product_provider.dart';

class SingleProduct extends StatefulWidget {
  
  const SingleProduct({super.key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {


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
    return Row(
      children:productProvider.getHerbProductDataList.map((e){
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductOverview(
              productImage: e.productImage,
              productName: e.productName,
              productPrice: e.productPrice,
              productId:e.productId,
            ),),);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 230,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Image.network(
                      e.productImage,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.productName),
                        Text(
                          "${e.productPrice.toString()}\$/50 Gram",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 4),
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Text(
                                      "50 Gram",
                                      style: TextStyle(fontSize: 10),
                                    )),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                           /*  Count(
                              productId: e.productId,
                              productImage: e.productImage,
                              productName: e.productName,
                              productPrice: e.productPrice,
                              productQuantity: 5,
                             
                            ), */
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(), 
        
      
    );
  }
}





 