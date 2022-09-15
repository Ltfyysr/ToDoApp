import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/yapilacaklar_kayit_cubit.dart';


class KayitSayfasi extends StatefulWidget {
  const KayitSayfasi({Key? key}) : super(key: key);

  @override
  State<KayitSayfasi> createState() => _YapilacakIsKayitState();
}

class _YapilacakIsKayitState extends State<KayitSayfasi> {
  var tfIsKontrol = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yapılacak İş Kayıt"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfIsKontrol,
                decoration: InputDecoration(hintText: "Yapılacak İş"),
              ),
              ElevatedButton(
                  onPressed: () { context.read<YapilacaklarKayitCubit>().kayit(tfIsKontrol.text); },
                  child: const Text("KAYDET"),style: ElevatedButton.styleFrom(primary: Color(0xFF798E93)),),
            ],
          ),
        ),
      ),
    );
  }
}
