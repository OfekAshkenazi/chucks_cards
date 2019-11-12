// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChuckNorrisDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChuckNorrisJokeDTO _$ChuckNorrisJokeDTOFromJson(Map<String, dynamic> json) {
  return ChuckNorrisJokeDTO(json['icon_url'] as String, json['id'] as String,
      json['url'] as String, json['value'] as String);
}

Map<String, dynamic> _$ChuckNorrisJokeDTOToJson(ChuckNorrisJokeDTO instance) =>
    <String, dynamic>{
      'icon_url': instance.iconUrl,
      'id': instance.id,
      'url': instance.url,
      'value': instance.value
    };
