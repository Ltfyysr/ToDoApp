import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/anasayfa_cubit.dart';
import 'package:todo_app/cubit/yapilacaklar_detay_cubit.dart';
import 'package:todo_app/cubit/yapilacaklar_kayit_cubit.dart';
import 'package:todo_app/views/anasayfa.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AnasayfaCubit()),
        BlocProvider(create: (context)=> YapilacaklarKayitCubit()),
        BlocProvider(create: (context)=> YapilacaklarDetayCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.blue,
          ),
        ),
        home: const Anasayfa(),
      ),
    );
  }
}
