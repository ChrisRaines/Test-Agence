// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      json['nameProduct'] as String,
      json['priceProduct'] as String,
      json['inStock'] as bool,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'nameProduct': instance.nameProduct,
      'priceProduct': instance.priceProduct,
      'inStock': instance.inStock,
    };
