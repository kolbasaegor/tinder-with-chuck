import 'package:json_annotation/json_annotation.dart';

part 'joke.g.dart';

@JsonSerializable()
class Joke {
  final String uuid;
  final String text;
  final String imageUrl;

  const Joke({required this.uuid, required this.text, required this.imageUrl});

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);

  Map<String, dynamic> toJson() => _$JokeToJson(this);
}
