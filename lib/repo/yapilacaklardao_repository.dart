import 'package:todo_app/model/yapilacaklar.dart';

class YapilacaklarDaoRepository{//ortak repo olusturduk

  //liste olusturma
  Future<List<Yapilacaklar>> tumYapilacaklariAl() async{
      var yapilacaklarListesi = <Yapilacaklar>[];
      var y1 = Yapilacaklar(yapilacak_id: 1, yapilacak_is: "Ekmek Al");
      var y2 = Yapilacaklar(yapilacak_id: 2, yapilacak_is: "Fatura Öde");
      yapilacaklarListesi.add(y1);
      yapilacaklarListesi.add(y2);
      return yapilacaklarListesi;
  }

  Future<List<Yapilacaklar>> yapilacakAra(String aramaKelimesi) async{
    var yapilacaklarListesi = <Yapilacaklar>[];
    var y1 = Yapilacaklar(yapilacak_id: 1, yapilacak_is: "Ekmek Al");
    yapilacaklarListesi.add(y1);

    return yapilacaklarListesi;
  }

  Future<void> yapilacakSil(int yapilacak_id) async{
    print("Yapılacak iş sil: $yapilacak_id");
  }

   Future<void> yapilacaklarKayit(String yapilacak_is) async{
     print("İş kayıt: $yapilacak_is");
   }

  Future<void> yapilacakGuncelle(String yapilacak_is,int yapilacak_id) async{
    print("Yapılacak iş guncelle: $yapilacak_id");
  }

}