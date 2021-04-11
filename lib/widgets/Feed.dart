import 'package:flutter/material.dart';
import 'package:flutter_test_project/widgets/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  /*final items = [
    {
      'img':
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
      'creator': 'NXTLVL Design',
      'caption': 'Neon Transition',
      'likes': '192',
      'comments': '42'
    },
    {
      'img':
          'https://scontent-vie1-1.cdninstagram.com/v/t51.2885-15/e35/p1080x1080/144063432_243521160616644_1233220303068823971_n.jpg?_nc_ht=scontent-vie1-1.cdninstagram.com&_nc_cat=100&_nc_ohc=kYY8fwFZHz4AX_FcEYg&tp=1&oh=3f4c19e008c246c3c04790a4be749b40&oe=6057EDC6',
      'creator': 'Tárczy Eszter',
      'caption': 'New account...',
      'likes': '352',
      'comments': '15'
    },
    {
      'img':
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
      'creator': 'NXTLVL Design',
      'caption': 'Neon Transition',
      'likes': '12',
      'comments': '62'
    }
  ];*/

  _FeedState();

  @override
  Widget build(BuildContext context) {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    return Container(
      child: StreamBuilder(
        stream: posts.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return Post(
                img: document['img'],
                caption: document['caption'],
                likes: document['likes'],
                comments: document['comments'],
                creator: document['creator'],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
