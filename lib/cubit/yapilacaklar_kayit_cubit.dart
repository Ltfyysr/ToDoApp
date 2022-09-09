import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/repo/yapilacaklardao_repository.dart';

class YapilacaklarKayitCubit extends Cubit<void> {

  YapilacaklarKayitCubit():super(0);

  var yrepo= YapilacaklarDaoRepository();

  Future<void> kayit(String yapilacak_is) async{
    await yrepo.yapilacaklarKayit(yapilacak_is);
  }
}