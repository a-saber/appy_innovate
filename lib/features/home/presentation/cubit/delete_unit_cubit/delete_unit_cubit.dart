import 'package:appy_innovate/features/home/data/models/unit_model.dart';
import 'package:appy_innovate/features/home/data/repo/home_repo_imp.dart';
import 'package:appy_innovate/features/home/presentation/cubit/delete_unit_cubit/delete_unit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteUnitCubit extends Cubit<DeleteUnitState> {
  DeleteUnitCubit(this.homeRepoImp) : super(DeleteUnitInitialState());
  final HomeRepoImp homeRepoImp;
  static DeleteUnitCubit get(context) => BlocProvider.of(context);

  void deleteUnit({required UnitModel unitModel}) async {
    emit(DeleteUnitLoadingState());
    var response = await homeRepoImp.deleteUnit(unitModel: unitModel);
    response.fold((l) => emit(DeleteUnitErrorState(error: l)),
        (r) => emit(DeleteUnitSuccessState()));
  }
}
