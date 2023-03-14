class CardModel {
  final String? name;
  final String? number;
  final String? data;
  final String? svv;

  CardModel({
    required this.name,
    required this.number,
    required this.data,
    required this.svv,
  });

  factory CardModel.fromJson(Map<String, dynamic>? data) {
    return CardModel(
      name: data?["name"],
      number: data?["username"],
      data: data?["password"],
      svv: data?["avatar"],
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
