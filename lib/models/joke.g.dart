// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JokeAdapter extends TypeAdapter<Joke> {
  @override
  final int typeId = 1;

  @override
  Joke read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Joke(
      uuid: fields[0] as String,
      text: fields[1] as String,
      imageUrl: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Joke obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JokeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Joke _$JokeFromJson(Map<String, dynamic> json) => Joke(
      uuid: json['uuid'] as String,
      text: json['text'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$JokeToJson(Joke instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'text': instance.text,
      'imageUrl': instance.imageUrl,
    };
