import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CommentCount extends StatelessWidget {
  final String collectionName;
  final String timestamp;
  const CommentCount({Key? key, required this.collectionName, required this.timestamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(collectionName)
            .doc(timestamp)
            .snapshots(),
        builder: (context, AsyncSnapshot snap) {
          if (!snap.hasData)
            return Text(
              0.toString(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            );
          return Text(
            snap.data['comments count'].toString(),
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey),
          );
        },
      );

  }
}