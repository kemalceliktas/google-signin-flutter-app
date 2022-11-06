import 'package:flutter/material.dart';
import 'package:google_first_app/screens/home_screens/drawer_side.dart';
import 'package:google_first_app/utils/colors.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "My Profile",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
        elevation: 0.0,
      ),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ),
              Container(
                height: 548,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Assar Bugti",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("email@email.com"),
                                ],
                              ),
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  backgroundColor: scaffoldBackgroundColor,
                                  radius: 16,
                                  child: Icon(
                                    Icons.edit,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    listTile(
                      icon: Icons.shop_outlined,
                      title: "My Orders",
                    ),
                     listTile(
                      icon: Icons.location_on_outlined,
                      title: "My Delivery Address",
                    ),
                     listTile(
                      icon: Icons.person_outline,
                      title: "Refer A Friends",
                    ),
                     listTile(
                      icon: Icons.file_copy_outlined,
                      title: "Terms & Conditions",
                    ),
                     listTile(
                      icon: Icons.policy,
                      title: "Privacy Policy",
                    ),
                     listTile(
                      icon: Icons.add_chart_outlined,
                      title: "About",
                    ),
                     listTile(
                      icon: Icons.exit_to_app_outlined,
                      title: "Log Out",
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: scaffoldBackgroundColor,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1665615836067-e3af47d210b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
