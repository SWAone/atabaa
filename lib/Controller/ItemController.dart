import 'dart:async';
import 'package:ataba/view/model/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  RxList<Post> posts = RxList<Post>([]);

  @override
  void onInit() {
    super.onInit();
    // جلب العناصر من Firestore Collection
    FirebaseFirestore.instance
        .collection('atposts')
        .snapshots()
        .listen((snapshot) {
      posts.value = snapshot.docs
          .map((doc) => Post(
                title: doc['title'],
                imageUrl: doc['image'],
                docId: doc.id,
              ))
          .toList();
    });
  }
}
