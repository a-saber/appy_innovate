import 'package:appy_innovate/features/home/data/repo/home_repo_imp.dart';
import 'package:appy_innovate/features/home/presentation/cubit/get_invoice_cubit/get_invoice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetInvoiceCubit extends Cubit<GetInvoiceState> {
  GetInvoiceCubit(this.homeRepoImp) : super(GetInvoiceInitialState());
  final HomeRepoImp homeRepoImp;
  static GetInvoiceCubit get(context) => BlocProvider.of(context);

  void getInvoices() async {
    emit(GetInvoiceLoadingState());
    var response = await homeRepoImp.getIvoices();
    response.fold((l) => emit(GetInvoiceErrorState(error: l)),
        (r) => emit(GetInvoiceSuccessState(r)));
  }
}
