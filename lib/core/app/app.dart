import 'package:appy_innovate/core/service/service_locator.dart';
import 'package:appy_innovate/features/home/data/repo/home_repo_imp.dart';
import 'package:appy_innovate/features/home/presentation/cubit/add_invoice_cubit/add_invoice_cubit.dart';
import 'package:appy_innovate/features/home/presentation/cubit/get_unit_cubit/get_unit_cubit.dart';
import 'package:appy_innovate/features/home/presentation/views/home_view.dart';
import 'package:appy_innovate/features/home/presentation/views/invoice_form_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                GetUnitCubit(getIt.get<HomeRepoImp>())..getUnits()),
        BlocProvider(
            create: (context) => AddInvoiceCubit(getIt.get<HomeRepoImp>())),
      ],
      child: const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Appy Innovate',
          home: HomeView() // 2nd task
          //home: InvoiceFormView() // 3rd task
          ),
    );
  }
}
