class StockModel {
  final String industry;
  final String name;
  final String sector;
  final String symbol;

  StockModel.fromJson(Map<String, dynamic> json)
      : industry = json['Industry'],
        name = json['Name'],
        sector = json['Sector'],
        symbol = json['Symbol'];
}
