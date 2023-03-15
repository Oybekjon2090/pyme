import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pyme/domen/model/summa_model.dart';

class CardModel {
  final String? name;
  final String? number;
  final String? data;
  final String? svv;
  final String? docId;
  final List? arxiv;

  CardModel({
    required this.docId,
    required this.name,
    this.arxiv,
    required this.number,
    required this.data,
    required this.svv,
  });

  factory CardModel.fromJson(data,
      {
      String? docId,
      QuerySnapshot<Map<String, dynamic>>? arxiv}) {
    List<SummaModel> list = [];
    for (var e in arxiv?.docs ?? []) {
      list.add(SummaModel.fromJson(e.data(), e.id));
    }
    print('1 chisi ${data}');
    
    print('3 chisi ${list}');
    print('4 chisi ${docId}');

    return CardModel(
      docId: docId,
      arxiv: list,
      name: data?["name"],
      number: data?["number"],
      data: data?["data"],
      svv: data?["svv"],
    );
  }

  toJson() {
    return {
      "name": name,
      "number": number,
      "data": data,
      "svv": svv,
    };
  }
}
