/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_first_app/provider/review_cart_provider.dart';
import 'package:google_first_app/utils/colors.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productId;
  final int productQuantity;
  final int productPrice;

  const Count({
    super.key,
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
  });

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
        
           if(mounted){
            if(value.exists){
               setState((){
              isTrue =value.get("isAdd");
              
            })
            }
            
           }
          
        });
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    ReviewCartProvider reviewCartProvider =
        Provider.of<ReviewCartProvider>(context);
    return Container(
        height: 30,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        count--;
                        if (count == 0) {
                          isTrue = false;
                        }
                        reviewCartProvider.addReviewCartData(
                          cartId: widget.productId,
                          cartImage: widget.productImage,
                          cartName: widget.productName,
                          cartPrice: widget.productPrice,
                          cartQuantity: count,
                          
                        );
                      });
                    },
                    child: Icon(
                      Icons.remove,
                      size: 20,
                    ),
                  ),
                  Text(
                    count.toString(),
                    style: TextStyle(fontSize: 10),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                        reviewCartProvider.addReviewCartData(
                          cartId: widget.productId,
                          cartImage: widget.productImage,
                          cartName: widget.productName,
                          cartPrice: widget.productPrice,
                          
                          
                        );
                      });
                    },
                    child: Icon(
                      Icons.add,
                      size: 20,
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                    reviewCartProvider.addReviewCartData(
                      cartId: widget.productId,
                      cartImage: widget.productImage,
                      cartName: widget.productName,
                      cartPrice: widget.productPrice,
                     
                    );
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
              ));
  }
}
 */