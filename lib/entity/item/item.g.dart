// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$_$_ItemFromJson(Map<String, dynamic> json) {
  return _$_Item(
    id: json['id'] as int?,
    name: json['name'] as String?,
    price: json['price'] as int?,
    num: json['num'] as int?,
    category_id: json['category_id'] as int?,
    image_path: json['image_path'] as String?,
  );
}

Map<String, dynamic> _$_$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'num': instance.num,
      'category_id': instance.category_id,
      'image_path': instance.image_path,
    };
