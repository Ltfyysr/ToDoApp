import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/repo/yapilacaklardao_repository.dart';

class YapilacaklarDetayCubit extends Cubit <void> {

  YapilacaklarDetayCubit():super(0);

  var yrepo= YapilacaklarDaoRepository();

  Future<void> guncelle(String yapilacak_is, int yapilacak_id) async{
    await yrepo.yapilacakGuncelle(yapilacak_is,yapilacak_id);
  }
}