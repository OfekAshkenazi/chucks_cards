

import 'package:json_annotation/json_annotation.dart';
part 'ChuckNorrisDTO.g.dart';


@JsonSerializable()


class ChuckNorrisJokeDTO{
  String iconUrl;
  String id;
  String url;
  String  value;

  ChuckNorrisJokeDTO(this.iconUrl, this.id, this.url, this.value);

  factory ChuckNorrisJokeDTO.fromJson(Map<String,dynamic> json) => _$ChuckNorrisJokeDTOFromJson(json);


  Map<String,dynamic> toJson()=> _$ChuckNorrisJokeDTOToJson(this);
}
