import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pyme/domen/model/ccard_model.dart';

class CardController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool createLoading = false;
   creatCard({
    required VoidCallback onSuccess,
    required CardModel infos,
  }) async {
    createLoading = true;
    notifyListeners();
    // ignore: unused_local_variable
    var res = await firestore.collection("cards").add(CardModel(
      data: infos.data, 
      name: infos.name, 
      number: infos.number,
      svv: infos.svv
          
        ).toJson());
   
    createLoading = false;
    notifyListeners();
  }
}
