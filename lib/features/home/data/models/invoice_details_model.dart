import 'package:appy_innovate/features/home/data/models/unit_model.dart';

class InvoiceDetailsModel {
  String? lineNo;
  String? productName;
  String? unitNo;
  double? price;
  double? quantity;
  double? total;
  String? expiryDate;
  UnitModel? unitModel;

  InvoiceDetailsModel({
    this.lineNo,
    required this.productName,
    required this.unitNo,
    required this.price,
    required this.quantity,
    required this.total,
    required this.expiryDate,
  });

  InvoiceDetailsModel.fromJson(Map<String, dynamic> json) {
    lineNo = json['lineNo'];
    productName = json['productName'];
    unitNo = json['unitNo'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    expiryDate = json['expiryDate'];
  }

  Map<String, dynamic> toJson() {
    return {
      'lineNo': lineNo,
      'productName': productName,
      'unitNo': unitNo,
      'price': price,
      'quantity': quantity,
      'total': total,
      'expiryDate': expiryDate
    };
  }
}
