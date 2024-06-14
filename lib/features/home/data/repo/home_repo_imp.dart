import 'package:appy_innovate/features/home/data/models/invoice_details_model.dart';
import 'package:appy_innovate/features/home/data/models/unit_model.dart';
import 'package:appy_innovate/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepoImp extends HomeRepo {
  @override
  Future<Either<String, void>> addInvoice(
      {required InvoiceDetailsModel invoiceDetailsModel}) async {
    try {
      String newID = FirebaseFirestore.instance.collection('invoices').doc().id;
      invoiceDetailsModel.lineNo = newID;
      await FirebaseFirestore.instance
          .collection('invoices')
          .doc(invoiceDetailsModel.lineNo)
          .set(invoiceDetailsModel.toJson());
      return right(0);
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> addUnit({required UnitModel unitModel}) async {
    try {
      String newID = FirebaseFirestore.instance.collection('units').doc().id;
      unitModel.unitNo = newID;
      await FirebaseFirestore.instance
          .collection('units')
          .doc(unitModel.unitNo)
          .set(unitModel.toJson());
      return right(0);
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteInvoice(
      {required InvoiceDetailsModel invoiceDetailsModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection('invoices')
          .doc(invoiceDetailsModel.lineNo)
          .delete();
      return right(0);
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteUnit(
      {required UnitModel unitModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection('units')
          .doc(unitModel.unitNo)
          .delete();
      return right(0);
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> editInvoice(
      {required InvoiceDetailsModel invoiceDetailsModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection('invoices')
          .doc(invoiceDetailsModel.lineNo)
          .set(invoiceDetailsModel.toJson());
      return right(0);
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> editUnit({required UnitModel unitModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection('units')
          .doc(unitModel.unitNo)
          .set(unitModel.toJson());
      return right(0);
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<InvoiceDetailsModel>>> getIvoices() async {
    try {
      List<InvoiceDetailsModel> invoices = [];
      var response =
          await FirebaseFirestore.instance.collection('invoices').get();
      await Future.forEach(
          response.docs,
          (element) =>
              invoices.add(InvoiceDetailsModel.fromJson(element.data())));
      return right(invoices);
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<UnitModel>>> getUnits() async {
    try {
      List<UnitModel> units = [];
      var response = await FirebaseFirestore.instance.collection('units').get();
      await Future.forEach(response.docs,
          (element) => units.add(UnitModel.fromJson(element.data())));
      return right(units);
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }
}
