import 'package:appy_innovate/features/home/data/models/invoice_details_model.dart';
import 'package:appy_innovate/features/home/data/repo/home_repo_imp.dart';
import 'package:appy_innovate/features/home/presentation/cubit/delete_invoice_cubit/delete_invoice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteInvoiceCubit extends Cubit<DeleteInvoiceState> {
  DeleteInvoiceCubit(this.homeRepoImp) : super(DeleteInvoiceInitialState());
  final HomeRepoImp homeRepoImp;
  static DeleteInvoiceCubit get(context) => BlocProvider.of(context);

  void deleteInvoice({required InvoiceDetailsModel invoiceDetailsModel}) async {
    emit(DeleteInvoiceLoadingState());
    var response = await homeRepoImp.deleteInvoice(
        invoiceDetailsModel: invoiceDetailsModel);
    response.fold((l) => emit(DeleteInvoiceErrorState(error: l)),
        (r) => emit(DeleteInvoiceSuccessState()));
  }
}
