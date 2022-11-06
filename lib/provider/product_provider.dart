import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_first_app/models/product_modal.dart';

class ProductProvider with ChangeNotifier {
 late ProductModal productModal;
  
  late List<ProductModal>search;
  




  /// HERBS PRODUCT
  List<ProductModal> herbsProductList = [];
 

  fetchHerbsProductData() async {
    List<ProductModal> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();
    value.docs.forEach(
      (element) {
        productModal = ProductModal(
          productImage: element.get("productImage"),
          productPrice: element.get("productPrice"),
          productName: element.get("productName"),
          productId :element.get("productId"),
        );
        newList.add(productModal);
      },
    );
    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModal> get getHerbProductDataList {
    return herbsProductList;
  }
}
