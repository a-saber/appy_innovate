import 'package:appy_innovate/features/home/data/repo/home_repo_imp.dart';
import 'package:appy_innovate/features/home/presentation/cubit/get_unit_cubit/get_unit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUnitCubit extends Cubit<GetUnitState> {
  GetUnitCubit(this.homeRepoImp) : super(GetUnitInitialState());
  final HomeRepoImp homeRepoImp;
  static GetUnitCubit get(context) => BlocProvider.of(context);

  void getUnits() async {
    emit(GetUnitLoadingState());
    var response = await homeRepoImp.getUnits();
    response.fold((l) => emit(GetUnitErrorState(error: l)),
        (r) => emit(GetUnitSuccessState(r)));
  }
}
