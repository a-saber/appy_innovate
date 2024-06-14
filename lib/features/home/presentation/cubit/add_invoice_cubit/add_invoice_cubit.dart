import 'package:appy_innovate/features/home/data/models/invoice_details_model.dart';
import 'package:appy_innovate/features/home/data/repo/home_repo_imp.dart';
import 'package:appy_innovate/features/home/presentation/cubit/add_invoice_cubit/add_invoice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddInvoiceCubit extends Cubit<AddInvoiceState> {
  AddInvoiceCubit(this.homeRepoImp) : super(AddInvoiceInitialState());
  final HomeRepoImp homeRepoImp;
  static AddInvoiceCubit get(context) => BlocProvider.of(context);

  void addInvoice({required InvoiceDetailsModel invoiceDetailsModel}) async {
    emit(AddInvoiceLoadingState());
    var response =
        await homeRepoImp.addInvoice(invoiceDetailsModel: invoiceDetailsModel);
    response.fold((l) => emit(AddInvoiceErrorState(error: l)),
        (r) => emit(AddInvoiceSuccessState()));
  }
}
