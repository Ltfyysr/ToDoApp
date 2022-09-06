import 'package:flutter/material.dart';
import 'package:todo_app/detay_sayfasi.dart';
import 'package:todo_app/kayit_sayfasi.dart';
import 'package:todo_app/model/yapilacaklar.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  Future<List<Yapilacaklar>> yapilacaklariGoster() async {
    var yapilacaklarListesi = <Yapilacaklar>[];
    var y1 = Yapilacaklar(yapilacak_id: 1, yapilacak_is: "Ekmek Al");
    var y2 = Yapilacaklar(yapilacak_id: 2, yapilacak_is: "Fatura Öde");
    yapilacaklarListesi.add(y1);
    yapilacaklarListesi.add(y2);
    return yapilacaklarListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  aramaYapiliyorMu ?
        TextField(decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            print("Not ara: $aramaSonucu");
          },) : const Text("Yapılacaklar"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: () {
            setState((){aramaYapiliyorMu= false;});
          }, icon: Icon(Icons.clear)):
              IconButton(onPressed: (){
                setState((){aramaYapiliyorMu=true;});
              }, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: FutureBuilder<List<Yapilacaklar>>(
        future: yapilacaklariGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var yapilacaklarlistesi = snapshot.data;
            return ListView.builder(
              itemCount: yapilacaklarlistesi!.length,
              itemBuilder: (context, indeks) {
                var yapilacak = yapilacaklarlistesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetaySayfasi(
                                  yapilacak: yapilacak,
                                )));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${yapilacak.yapilacak_is}"),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                "${yapilacak.yapilacak_is} silinsin mi?"
                              ),
                                  action: SnackBarAction(label: "Evet", onPressed: (){})));
                            },
                            icon: Icon(Icons.delete_outline_outlined,color: Colors.black54,))
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => KayitSayfasi()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
