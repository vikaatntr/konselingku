import 'package:konselingku/app/data/model/artikel.dart';
import 'package:konselingku/app/data/services/artikel_services.dart';

class ArtikelRepository {
  static final ArtikelRepository _artikelRepository = ArtikelRepository._();
  static ArtikelRepository get instance => _artikelRepository;
  ArtikelRepository._();

  List<Artikel>? listArtikel;

  dispose() {
    listArtikel?.clear();
  }

  Future<List<Artikel>> getArtikel() async {
    if (listArtikel == null) {
      listArtikel = [];
    } else {
      listArtikel!.clear();
    }
    listArtikel!.addAll(await ArtikelServices.instance.getListArtikel());
    return listArtikel!;
  }

  Future<void> addShowArtikel(String key) =>
      ArtikelServices.instance.addShowArtikel(key);
}
