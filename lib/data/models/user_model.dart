// class UserModel {
//   int? id;
//   String? name;
//   String? username;
//   String? email;
//   Address? address;
//   String? phone;
//   String? website;
//   Company? company;

//   UserModel(
//       {this.id,
//       this.name,
//       this.username,
//       this.email,
//       this.address,
//       this.phone,
//       this.website,
//       this.company});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     username = json['username'];
//     email = json['email'];
//     address =
//         json['address'] != null ? Address.fromJson(json['address']) : null;
//     phone = json['phone'];
//     website = json['website'];
//     company =
//         json['company'] != null ? Company.fromJson(json['company']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['username'] = username;
//     data['email'] = email;
//     if (address != null) {
//       data['address'] = address!.toJson();
//     }
//     data['phone'] = phone;
//     data['website'] = website;
//     if (company != null) {
//       data['company'] = company!.toJson();
//     }
//     return data;
//   }
// }

// class Address {
//   String? street;
//   String? suite;
//   String? city;
//   String? zipcode;
//   Geo? geo;

//   Address({this.street, this.suite, this.city, this.zipcode, this.geo});

//   Address.fromJson(Map<String, dynamic> json) {
//     street = json['street'];
//     suite = json['suite'];
//     city = json['city'];
//     zipcode = json['zipcode'];
//     geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['street'] = street;
//     data['suite'] = suite;
//     data['city'] = city;
//     data['zipcode'] = zipcode;
//     if (geo != null) {
//       data['geo'] = geo!.toJson();
//     }
//     return data;
//   }
// }

// class Geo {
//   String? lat;
//   String? lng;

//   Geo({this.lat, this.lng});

//   Geo.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     lng = json['lng'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['lat'] = lat;
//     data['lng'] = lng;
//     return data;
//   }
// }

// class Company {
//   String? name;
//   String? catchPhrase;
//   String? bs;

//   Company({this.name, this.catchPhrase, this.bs});

//   Company.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     catchPhrase = json['catchPhrase'];
//     bs = json['bs'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     data['catchPhrase'] = catchPhrase;
//     data['bs'] = bs;
//     return data;
//   }
// }

import 'package:cleva_test/domain/user_entitiy.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.address,
    required super.phone,
    required super.website,
    required super.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      website: json['website'] as String,
      company: CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
    );
  }
}

class AddressModel extends Address {
  AddressModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      geo: GeoModel.fromJson(json['geo'] as Map<String, dynamic>),
    );
  }
}

class GeoModel extends Geo {
  GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
    );
  }
}

class CompanyModel extends Company {
  CompanyModel({
    required super.name,
    required super.catchPhrase,
    required super.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'] as String,
      catchPhrase: json['catchPhrase'] as String,
      bs: json['bs'] as String,
    );
  }
}
