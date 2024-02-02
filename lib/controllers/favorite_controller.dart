import 'package:coin_app/models/models.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FavoritesController extends GetxController {
  final RxList<Crypto> _favorites = <Crypto>[].obs;

  final Box<Crypto> _favoritesBox = Hive.box<Crypto>('favorites');

  @override
  void onInit() {
    super.onInit();
    _favorites.clear();
    _favorites.value.addAll(_favoritesBox.values.toList());
  }

  bool isFavorite(Crypto crypto) {
    return _favorites.contains(crypto);
  }

  void toggleFavorite(Crypto crypto) {
    if (isFavorite(crypto)) {
      _favorites.remove(crypto);
      _favoritesBox.delete(crypto.id.toString());
    } else {
      _favoritesBox.put(crypto.id, crypto);
      _favorites.add(crypto);
    }
  }

  List<Crypto> get favorites => _favorites;
}
