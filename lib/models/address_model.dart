// ignore_for_file: unused_field, recursive_getters

class AddressModel {
  late int? _id;
  late String _addressType;
  late String? _contactPersonName;
  late String? _contactPersonNumber;
  late String _address;
  late String _latitude;
  late String _longitude;

  AddressModel(
      {id,
      required addresType,
      contactPersonName,
      contactPersonNumber,
      address,
      latitude,
      longitude}) {
    _id = id;
    _addressType = addresType;
    _contactPersonName = contactPersonName;
    _contactPersonNumber = contactPersonNumber;
    _longitude = longitude;
    _latitude = latitude;
  }
  String get address => _address;
  String get addressType => _addressType;
  String? get contactPersonName => _contactPersonName;
  String? get contactPersonNumber => contactPersonNumber;
  String get latitude => _latitude;
  String get longitude => _longitude;
  AddressModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _addressType = json['address_type'] ?? "";
    _contactPersonNumber = json['_contact_person_number'] ?? "";
    _contactPersonName = json['contact_person_name'] ?? "";
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
}
