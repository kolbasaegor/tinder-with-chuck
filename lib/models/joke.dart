import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joke.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Joke extends Equatable {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final String imageUrl;

  const Joke({required this.uuid, required this.text, required this.imageUrl});

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);

  Map<String, dynamic> toJson() => _$JokeToJson(this);

  @override
  List<Object?> get props => [uuid, text, imageUrl];
}
