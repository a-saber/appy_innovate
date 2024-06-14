import 'package:appy_innovate/features/home/data/models/invoice_details_model.dart';
import 'package:appy_innovate/features/home/data/models/unit_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  //add
  Future<Either<String, void>> addUnit({required UnitModel unitModel});
  Future<Either<String, void>> addInvoice(
      {required InvoiceDetailsModel invoiceDetailsModel});

  // get
  Future<Either<String, List<UnitModel>>> getUnits();
  Future<Either<String, List<InvoiceDetailsModel>>> getIvoices();

  //edit
  Future<Either<String, void>> editUnit({required UnitModel unitModel});
  Future<Either<String, void>> editInvoice(
      {required InvoiceDetailsModel invoiceDetailsModel});

  //delete
  Future<Either<String, void>> deleteUnit({required UnitModel unitModel});
  Future<Either<String, void>> deleteInvoice(
      {required InvoiceDetailsModel invoiceDetailsModel});
}
