abstract class AddInvoiceState {}

class AddInvoiceInitialState extends AddInvoiceState {}

class AddInvoiceLoadingState extends AddInvoiceState {}

class AddInvoiceSuccessState extends AddInvoiceState {}

class AddInvoiceErrorState extends AddInvoiceState {
  String error;
  AddInvoiceErrorState({required this.error});
}
