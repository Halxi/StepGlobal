// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return Driver(
    json['driver_id'] as String,
    json['driver_firstname'] as String,
    json['driver_lastname'] as String,
    json['driver_license'] as String,
    json['baseLocation'] as String,
    json['recordKeeper'] as String,
    json['homeBaseTimeZone'] as String,
  );
}

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'driver_id': instance.driver_id,
      'driver_firstname': instance.driver_firstname,
      'driver_lastname': instance.driver_lastname,
      'driver_license': instance.driver_license,
      'baseLocation': instance.baseLocation,
      'recordKeeper': instance.recordKeeper,
      'homeBaseTimeZone': instance.homeBaseTimeZone,
    };
