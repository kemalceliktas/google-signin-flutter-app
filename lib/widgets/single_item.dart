import 'package:flutter/material.dart';
import 'package:google_first_app/utils/colors.dart';


class SingleItem extends StatelessWidget {
   bool isBool;
   String productName;
   String productImage;
   int productPrice;
   int productQuantity;
   String productId;
   Function delete;
   
     SingleItem({this.isBool=false,required this.productName, required this.productImage, required this.productPrice, required this.productQuantity, required this.productId, required this.delete});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      
      child: Column(
        children:
          [ Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                child: Center(
                  child: Image.network(
                      productImage),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                    
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         productName,
                          style: TextStyle(
                              color: textColor, fontWeight: FontWeight.bold),
                        ),
                      isBool==false? Text("\$50"):Text(
                          "50\$/50 Gram",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                     children:  isBool == false ?  [
                      Center(child: Text("50 Gram"))
                     ] :[
                          Expanded(
                          child:Text(
                              "50 Gram",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 32,
                ),
                child: Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 20,
                        ),
                      isBool == false ? InkWell(onTap:(){
                        delete();
                      },child: Icon(Icons.delete)) :Text("ADD",style: TextStyle(
                          color: Colors.black,
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
          ],
        
        
      ),
    );
  }
}


