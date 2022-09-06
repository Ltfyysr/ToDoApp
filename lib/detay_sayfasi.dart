import 'package:flutter/material.dart';
import 'package:todo_app/model/yapilacaklar.dart';

class DetaySayfasi extends StatefulWidget {
  Yapilacaklar yapilacak;

  DetaySayfasi({required this.yapilacak});

  @override
  State<DetaySayfasi> createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  var tfIsKontrol=TextEditingController();

  Future<void> guncelle(String yapilacak_is) async{
    print("iş guncelle: $yapilacak_is");
  }
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
                guncelle(tfIsKontrol.text);
              }, child: const Text("GÜNCELLE")),
            ],
          ),
        ),
      ),
    );
  }
}
