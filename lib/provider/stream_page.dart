import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
  stream: FirebaseFirestore.instance.collection('usersData').snapshots(),
  builder: (_, snapshot) {
    if (snapshot.hasError) return Text('Error = ${snapshot.error}');

    if (snapshot.hasData) {
      final docs = snapshot.data!.docs;
      return ListView.builder(
        itemCount: docs.length,
        itemBuilder: (_, i) {
          final data = docs[i].data();
          return ListTile(
            title: Text(data['userEmail']),
            
          );
        },
      );
    }

    return Center(child: CircularProgressIndicator());
  },
  
),
      ),
    );

  }
}