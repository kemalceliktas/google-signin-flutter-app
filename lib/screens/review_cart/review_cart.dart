import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_first_app/models/review_cart_modal.dart';
import 'package:google_first_app/provider/review_cart_provider.dart';
import 'package:google_first_app/widgets/single_item.dart';
import 'package:provider/provider.dart';

import '../../provider/product_provider.dart';
import '../../utils/colors.dart';


class ReviewCart extends StatefulWidget {
  const ReviewCart({super.key});

  @override
  State<ReviewCart> createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {

  /* showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {},
  );
  Widget continueButton = TextButton(
    child: Text("Yes"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete Cart Product"),
    content: Text("Would you like to continue delete that product"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
} */

  
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListTile(
          title: Text("Total Amount"),
          subtitle: Text(
            "\$ 170.00",
            style: TextStyle(
              color: Colors.green[900],
            ),
          ),
          trailing: Container(
            width: 160,
            child: MaterialButton(
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {},
              child: Text("Submit"),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Review Cart",
          style: TextStyle(color: textColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body:reviewCartProvider.getReviewCartDataList.isEmpty ? Center(
        child: Text("No Data"),
      ): ListView.builder(
        itemCount: reviewCartProvider.getReviewCartDataList.length,
        itemBuilder: (context, index) {
          ReviewCartModal data = reviewCartProvider.getReviewCartDataList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                productQuantity: data.cartQuantity,
                productId: data.cartId,
                isBool: false,
                productName:data.cartName,
                productImage:
                    data.cartImage,
                productPrice: data.cartPrice,
                
                delete:(){


                 FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser!.uid)  
    .collection("YourReviewCart").doc(data.cartId)
    .delete(); 
                },
                 
                    
               
              ),
            ],
          );
        },
      ),
    );
  }

  
}


