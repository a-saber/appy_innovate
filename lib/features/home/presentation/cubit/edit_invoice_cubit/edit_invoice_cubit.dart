import 'package:appy_innovate/features/home/data/models/invoice_details_model.dart';
import 'package:appy_innovate/features/home/data/repo/home_repo_imp.dart';
import 'package:appy_innovate/features/home/presentation/cubit/edit_invoice_cubit/edit_invoice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditInvoiceCubit extends Cubit<EditInvoiceState> {
  EditInvoiceCubit(this.homeRepoImp) : super(EditInvoiceInitialState());
  final HomeRepoImp homeRepoImp;
  static EditInvoiceCubit get(context) => BlocProvider.of(context);

  void editInvoice({required InvoiceDetailsModel invoiceDetailsModel}) async {
    emit(EditInvoiceLoadingState());
    var response =
        await homeRepoImp.editInvoice(invoiceDetailsModel: invoiceDetailsModel);
    response.fold((l) => emit(EditInvoiceErrorState(error: l)),
        (r) => emit(EditInvoiceSuccessState()));
  }
}
