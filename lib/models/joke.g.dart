// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke.dart';

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
