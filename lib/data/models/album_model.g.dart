// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumsModelAdapter extends TypeAdapter<AlbumsModel> {
  @override
  final int typeId = 1;

  @override
  AlbumsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumsModel(
      id: fields[0] as int?,
      photos: (fields[1] as List?)?.cast<String>(),
      description: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AlbumsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.photos)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
