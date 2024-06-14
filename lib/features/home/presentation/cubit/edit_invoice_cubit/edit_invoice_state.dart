abstract class EditInvoiceState {}

class EditInvoiceInitialState extends EditInvoiceState {}

class EditInvoiceLoadingState extends EditInvoiceState {}

class EditInvoiceSuccessState extends EditInvoiceState {}

class EditInvoiceErrorState extends EditInvoiceState {
  String error;
  EditInvoiceErrorState({required this.error});
}
