// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:pyme/domen/model/ccard_model.dart';

import '../domen/model/summa_model.dart';

class CardController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool createLoading = false;
  bool createCardLoading = false;
  bool editLoading = false;
  bool summaLoading = false;
  bool deleteLoading = false;
  List<CardModel> list = [];
  List<SummaModel> listOfArxiv = [];
  bool arxivLoading = false;
  int currentIndex = 0;
  creatCard({
    required VoidCallback onSuccess,
    required CardModel infos,
  }) async {
    createLoading = true;
    notifyListeners();
    // ignore:
    var res = await firestore.collection("cards").add(CardModel(
            data: infos.data,
            name: infos.name,
            number: infos.number,
            svv: infos.svv,
            docId: '')
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
      list.add(CardModel.fromJson(element.data(), docId: docId));
      debugPrint('${list.length}');
    }
    createCardLoading = false;
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
                  docId: '')
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

  addSumma({
    required SummaModel info,
    required String docId,
    required CardModel infos,
    required VoidCallback onSuccess,
  }) async {
    summaLoading = true;
    notifyListeners();

    CollectionReference users = firestore.collection('cards');
    // ignore:
    var res = await users.doc(infos.docId).collection('arxiv').add(
          SummaModel(
            arxivId: "",
            date: info.date,
            summaKomment: info.summaKomment,
            summa: info.summa,
          ).toJson(),
        );

    users.doc(infos.docId).update(CardModel(
          docId: infos.docId,
          data: infos.data,
          name: infos.name,
          number: infos.number,
          svv: infos.svv,
        ).toJson());
    summaLoading = false;
    notifyListeners();
    onSuccess();
  }

  getArxiv({required String docId}) async {
    arxivLoading = true;
    notifyListeners();
    listOfArxiv.clear();
    var res = await firestore
        .collection("cards")
        .doc(docId)
        .collection("arxiv")
        .get();
    for (var element in res.docs) {
      String docId = element.id;
      listOfArxiv.add(SummaModel.fromJson(element.data(), docId) );
    }
    arxivLoading = false;
    notifyListeners();
  }

  deleteUser({required String docId, required VoidCallback onSuccess}) async {
    deleteLoading = true;
    notifyListeners();
    CollectionReference cards = firestore.collection('cards');
    await cards.doc(docId).delete();
    deleteLoading = false;
    notifyListeners();
    onSuccess();
  }
}
