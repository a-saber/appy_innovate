import 'package:appy_innovate/features/home/data/models/unit_model.dart';
import 'package:appy_innovate/features/home/data/repo/home_repo_imp.dart';
import 'package:appy_innovate/features/home/presentation/cubit/add_unit_cubit/add_unit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUnitCubit extends Cubit<AddUnitState> {
  AddUnitCubit(this.homeRepoImp) : super(AddUnitInitialState());
  final HomeRepoImp homeRepoImp;
  static AddUnitCubit get(context) => BlocProvider.of(context);

  void addUnit({required UnitModel unitModel}) async {
    emit(AddUnitLoadingState());
    var response = await homeRepoImp.addUnit(unitModel: unitModel);
    response.fold((l) => emit(AddUnitErrorState(error: l)),
        (r) => emit(AddUnitSuccessState()));
  }
}
