import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:pyme/domen/model/ccard_model.dart';

class CardController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool createLoading = false;
  bool createCardLoading = false;
  bool editLoading = false;
  List<CardModel> list = [];
   int currentIndex = 0;
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
            svv: infos.svv,
            docId: ''
            
            )
        .toJson());

    createLoading = false;
    notifyListeners();
  }

  getCards() async {
    createCardLoading = true;
    notifyListeners();
    // ignore: prefer_typing_uninitialized_variables
    var res;

    res = await firestore.collection("cards").get();
    list.clear();
    for (var element in res.docs) {
      String docId = element.id;
      list.add(CardModel.fromJson(element.data(), docId));
      debugPrint('${list.length}');
    }
    createCardLoading = false;
    print('Cards ${list.length}');
    notifyListeners();
  }

  editUser({
    required VoidCallback onSuccess,
    required CardModel infos,
    
  }) async {
    editLoading = true;
    String? docId;
    notifyListeners();

    await firestore.collection("cards").doc(infos.docId).update(
          CardModel(
                  name: infos.name,
                  number: infos.number,
                  data: infos.data,
                  svv: infos.svv,
                  docId: ''
                  )
              .toJson(),
        );
    editLoading = false;
    notifyListeners();
    onSuccess();
  }

   setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

}
