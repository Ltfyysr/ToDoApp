import 'package:flutter/material.dart';


class KayitSayfasi extends StatefulWidget {
  const KayitSayfasi({Key? key}) : super(key: key);

  @override
  State<KayitSayfasi> createState() => _YapilacakIsKayitState();
}

class _YapilacakIsKayitState extends State<KayitSayfasi> {
  var tfIsKontrol = TextEditingController();

  Future<void> kayit(String yapilacak_is) async{
    print(("İş kayıt: $yapilacak_is"));
  }

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
                  onPressed: () { kayit(tfIsKontrol.text); },
                  child: const Text("KAYDET")),
            ],
          ),
        ),
      ),
    );
  }
}
