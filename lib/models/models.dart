import 'package:hive/hive.dart';

part 'models.g.dart'; // Add this line

@HiveType(typeId: 0) // Add this annotation
class Crypto {
  @HiveField(0) // Add this annotation
  final int id;
  @HiveField(1) // Add this annotation
  final int rank;
  @HiveField(2) // Add this annotation
  final String name;
  @HiveField(3) // Add this annotation
  final String symbol;
  @HiveField(4) // Add this annotation
  final String slug;
  @HiveField(5) // Add this annotation
  final bool isActive;
  @HiveField(6) // Add this annotation
  final DateTime firstHistoricalData;
  @HiveField(7) // Add this annotation
  final DateTime lastHistoricalData;
  @HiveField(8) // Add this annotation
  final Platform? platform;

  Crypto({
    required this.id,
    required this.rank,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.isActive,
    required this.firstHistoricalData,
    required this.lastHistoricalData,
    required this.platform,
  });

  // Factory constructor for deserialization from JSON
  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      id: json['id'],
      rank: json['rank'],
      name: json['name'],
      symbol: json['symbol'],
      slug: json['slug'],
      isActive: json['is_active'] == 1,
      firstHistoricalData: DateTime.parse(json['first_historical_data']),
      lastHistoricalData: DateTime.parse(json['last_historical_data']),
      platform:
          json['platform'] != null ? Platform.fromJson(json['platform']) : null,
    );
  }
}

@HiveType(typeId: 1) // Add this annotation
class Platform {
  @HiveField(0) // Add this annotation
  final int id;
  @HiveField(1) // Add this annotation
  final String name;
  @HiveField(2) // Add this annotation
  final String symbol;
  @HiveField(3) // Add this annotation
  final String slug;
  @HiveField(4) // Add this annotation
  final String tokenAddress;

  Platform({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.tokenAddress,
  });

  factory Platform.fromJson(Map<String, dynamic> json) {
    return Platform(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      slug: json['slug'],
      tokenAddress: json['token_address'],
    );
  }
}
