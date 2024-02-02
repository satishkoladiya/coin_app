// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoAdapter extends TypeAdapter<Crypto> {
  @override
  final int typeId = 0;

  @override
  Crypto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Crypto(
      id: fields[0] as int,
      rank: fields[1] as int,
      name: fields[2] as String,
      symbol: fields[3] as String,
      slug: fields[4] as String,
      isActive: fields[5] as bool,
      firstHistoricalData: fields[6] as DateTime,
      lastHistoricalData: fields[7] as DateTime,
      platform: fields[8] as Platform?,
    );
  }

  @override
  void write(BinaryWriter writer, Crypto obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.rank)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.symbol)
      ..writeByte(4)
      ..write(obj.slug)
      ..writeByte(5)
      ..write(obj.isActive)
      ..writeByte(6)
      ..write(obj.firstHistoricalData)
      ..writeByte(7)
      ..write(obj.lastHistoricalData)
      ..writeByte(8)
      ..write(obj.platform);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlatformAdapter extends TypeAdapter<Platform> {
  @override
  final int typeId = 1;

  @override
  Platform read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Platform(
      id: fields[0] as int,
      name: fields[1] as String,
      symbol: fields[2] as String,
      slug: fields[3] as String,
      tokenAddress: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Platform obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.symbol)
      ..writeByte(3)
      ..write(obj.slug)
      ..writeByte(4)
      ..write(obj.tokenAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlatformAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
