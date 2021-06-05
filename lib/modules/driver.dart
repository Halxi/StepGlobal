import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'driver.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Driver {
  String driver_id;
  String driver_firstname;
  String driver_lastname;
  String driver_license;
  String baseLocation;
  String recordKeeper;
  String homeBaseTimeZone;

  Driver(this.driver_id, this.driver_firstname, this.driver_lastname, this.driver_license, this.baseLocation, this.recordKeeper, this.homeBaseTimeZone);

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$DriverToJson(this);

}