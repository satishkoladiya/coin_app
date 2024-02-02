import 'package:hive/hive.dart';

import '../models/models.dart';

class CacheManager {
  static const _cacheKey = 'crypto_cache';

  static late Box<Crypto> cachedBox;

  static Future<void> cacheData(List<Crypto> data) async {
    for (final crypto in data) {
      await cachedBox.put(crypto.id, crypto);
    }
  }

  static Future<List<Crypto>> getCachedData() async {
    try {
      final List<Crypto> cachedCryptos = cachedBox.values.toList();
      return cachedCryptos;
    } catch (e) {
      print("Error getting cached data: $e");
      return [];
    }
  }

  static bool isDataCached() {
    final box = Hive.box(_cacheKey);
    return box.containsKey('crypto_data');
  }
}
