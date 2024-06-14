import 'package:appy_innovate/features/home/data/models/invoice_details_model.dart';

abstract class GetInvoiceState {}

class GetInvoiceInitialState extends GetInvoiceState {}

class GetInvoiceLoadingState extends GetInvoiceState {}

class GetInvoiceSuccessState extends GetInvoiceState {
  List<InvoiceDetailsModel> invoices;
  GetInvoiceSuccessState(this.invoices);
}

class GetInvoiceErrorState extends GetInvoiceState {
  String error;
  GetInvoiceErrorState({required this.error});
}
