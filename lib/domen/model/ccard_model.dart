class CardModel {
  final String? name;
  final String? number;
  final String? data;
  final String? svv;
  final String? docId;

  CardModel( {
    required this.docId,
    required this.name,
    required this.number,
    required this.data,
    required this.svv,
  });

  factory CardModel.fromJson(Map<String, dynamic> data, String docId) {
    return CardModel(
      docId: docId,
      name: data["name"],
      number: data["number"],
      data: data["data"],
      svv: data["svv"],
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
