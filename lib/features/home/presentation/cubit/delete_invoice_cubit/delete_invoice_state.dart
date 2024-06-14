abstract class DeleteInvoiceState {}

class DeleteInvoiceInitialState extends DeleteInvoiceState {}

class DeleteInvoiceLoadingState extends DeleteInvoiceState {}

class DeleteInvoiceSuccessState extends DeleteInvoiceState {}

class DeleteInvoiceErrorState extends DeleteInvoiceState {
  String error;
  DeleteInvoiceErrorState({required this.error});
}
