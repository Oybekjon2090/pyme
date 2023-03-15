class SummaModel {
  final String? date;
  final String? arxivId;
  final num? summa;
  final String? summaKomment;

  SummaModel( {
    required this.arxivId,
    required this.date,
    required this.summa,
    required this.summaKomment,
  });

  factory SummaModel.fromJson(
    Map<String, dynamic> data,
    String docId,
  ) {
    return SummaModel(
        date: data['date'],
        summa: data['summa'],
        summaKomment: data['summaniCommenti'],
        arxivId: docId);
  }

  toJson() {
    return {
      'date': date,
      'summa': summa,
      'summaniCommenti': summaKomment,
    };
  }
}
