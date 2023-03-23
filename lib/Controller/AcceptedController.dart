import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AcceptedController extends GetxController {
  List<Map> AllAccepted = [];
  List<String> AcceptedDocId = [];
  void getAccepted() async {
    await FirebaseFirestore.instance.collection('Accepted').get().then((value) {
      value.docs.forEach((element) {
        AllAccepted.add(element.data());
        AcceptedDocId.add(element.id);
      });
    }).then((value) {
      update();
    });
  }

  @override
  void onInit() {
    getAccepted();
    super.onInit();
  }
}
