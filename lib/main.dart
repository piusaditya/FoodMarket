import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'cubit/cubit.dart';
import 'models/models.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> UserCubit()),
        BlocProvider(create: (_)=> FoodCubit()),
        BlocProvider(create: (_)=> TransactionCubit()),
      ],
          child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // Set the start page of the app
        home: SignInPage(),
      ),
    );
  }
}
