import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/yapilacaklar_detay_cubit.dart';
import 'package:todo_app/model/yapilacaklar.dart';

class DetaySayfasi extends StatefulWidget {
  Yapilacaklar yapilacak;

  DetaySayfasi({required this.yapilacak});

  @override
  State<DetaySayfasi> createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  var tfIsKontrol=TextEditingController();


  @override
  void initState() {
    super.initState();
    var yapilacak=widget.yapilacak;
    tfIsKontrol.text=yapilacak.yapilacak_is;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yapılacak İş Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfIsKontrol,decoration: InputDecoration(hintText: tfIsKontrol.text),),
              ElevatedButton(onPressed: (){
                context.read<YapilacaklarDetayCubit>().guncelle(tfIsKontrol.text,widget.yapilacak.yapilacak_id);
              }, child: const Text("GÜNCELLE"),style: ElevatedButton.styleFrom(primary: Color(0xFF798E93)),),
            ],
          ),
        ),
      ),
    );
  }
}
