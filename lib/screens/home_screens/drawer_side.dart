import 'package:flutter/material.dart';
import 'package:google_first_app/provider/stream_page.dart';
import 'package:google_first_app/screens/home_screens/home.dart';
import 'package:google_first_app/screens/my_profile/my_profile.dart';
import 'package:google_first_app/screens/review_cart/review_cart.dart';


class DrawerSide extends StatefulWidget {
  const DrawerSide({super.key});

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
   Widget listTile({
    required IconData icon,
    required String title,
    required Widget screen,
  }){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      child: ListTile(
        onTap:(){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screen),);
        },
        leading: Icon(icon,size: 32,),
        title: Text(title,style: TextStyle(color: Colors.black45),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color(0xffd6b738),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 43,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome Guest"),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 30,
                        width: 80,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Login"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
            ),

            listTile(icon: Icons.home_filled,title: "Home",screen: HomeScreen()),
            listTile(icon: Icons.shopping_bag,title: "Review Cart",screen: ReviewCart()),
            listTile(icon: Icons.person,title: "My Profile",screen: MyProfile()),
            listTile(icon: Icons.notifications,title: "Notification",screen: HomeScreen()),
            listTile(icon: Icons.star,title: "Rating § Review",screen: StreamPage()),
            listTile(icon: Icons.heart_broken_outlined,title: "Wishlist",screen: HomeScreen()),
            listTile(icon: Icons.info_rounded,title: "Raise Complaint",screen: HomeScreen()),
            listTile(icon: Icons.question_answer,title: "FAQs",screen: HomeScreen()),
            
            Container(
               margin: EdgeInsets.symmetric(horizontal: 30,vertical: 4),
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("Call us:"),
                      Text("   +937182371872381",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("Mail us:"),
                      Text("   email@email.com",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      );
  }
}