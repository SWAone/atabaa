import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class uplodedController extends GetxController {
  String? uid;
  List<Map> users = [];
  uplodedController({this.uid});

  @override
  void onInit() async {
    print('object');
    getUsers();
    super.onInit();
  }

  void getUsers() async {
    print('========== $uid');
    await FirebaseFirestore.instance
        .collection('atusers')
        .doc(uid)
        .collection('users')
        .where("need", isEqualTo: 11)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        users.add(element.data());
      });
    }).then((value) {
      update();
    });
  }
}
