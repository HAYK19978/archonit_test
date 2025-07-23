import 'package:archonit_test_prj/features/colors_list/data/dto/colors_remote_datasource.dart';
import 'package:archonit_test_prj/features/colors_list/data/repository/colors_repository_impl.dart';
import 'package:archonit_test_prj/features/colors_list/domain/usecases/%20fetch_crypto_usecase.dart';
import 'package:archonit_test_prj/features/colors_list/presentation/cubit/colors_cubit.dart';
import 'package:archonit_test_prj/features/colors_list/presentation/pages/colors_list_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final remoteDataSource = ColorsRemoteDataSource(dio);
    final repository = ColorsRepositoryImpl(remoteDataSource);
    final useCase = FetchCryptoUseCase(repository);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorsCubit>(
          create: (_) => ColorsCubit(useCase)..fetchNext(),
        ),
      ],
      child: MaterialApp(
        title: 'Archonit test project',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: ColorsListPage(),
      ),
    );
  }
}
