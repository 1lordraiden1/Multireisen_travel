// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_voucher_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVoucherResponse _$GetVoucherResponseFromJson(Map<String, dynamic> json) =>
    GetVoucherResponse(
      accessToken: json['accessToken'] as String?,
      version: json['version'] as String?,
      serverDate: json['serverDate'] == null
          ? null
          : DateTime.parse(json['serverDate'] as String),
      server: json['server'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetVoucherResponseToJson(GetVoucherResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'version': instance.version,
      'serverDate': instance.serverDate?.toIso8601String(),
      'server': instance.server,
      'data': instance.data,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      dataClass: json['class'] as String?,
      properties: json['properties'] == null
          ? null
          : Properties.fromJson(json['properties'] as Map<String, dynamic>),
      remarks:
          (json['remarks'] as List<dynamic>?)?.map((e) => e as String).toList(),
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => RoomReserved.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'class': instance.dataClass,
      'properties': instance.properties,
      'remarks': instance.remarks,
      'rooms': instance.rooms,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      bookingNumber: json['bookingNumber'] as String?,
      reference: json['reference'],
      supplierReference: json['supplierReference'] as String?,
      supplierName: json['supplierName'] as String?,
      issued: json['issued'] == null
          ? null
          : DateTime.parse(json['issued'] as String),
      checkIn: json['checkIn'] == null
          ? null
          : DateTime.parse(json['checkIn'] as String),
      checkOut: json['checkOut'] == null
          ? null
          : DateTime.parse(json['checkOut'] as String),
      nights: json['nights'] as String?,
      hotelName: json['hotelName'] as String?,
      category: json['category'] as String?,
      meal: json['meal'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      adults: (json['adults'] as num?)?.toInt(),
      children: (json['children'] as num?)?.toInt(),
      incomingOffice: json['incomingOffice'],
      agencyReferent: json['agencyReferent'],
      office: json['office'] == null
          ? null
          : Office.fromJson(json['office'] as Map<String, dynamic>),
      geocodes: json['geocodes'] == null
          ? null
          : Geocodes.fromJson(json['geocodes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'bookingNumber': instance.bookingNumber,
      'reference': instance.reference,
      'supplierReference': instance.supplierReference,
      'supplierName': instance.supplierName,
      'issued': instance.issued?.toIso8601String(),
      'checkIn': instance.checkIn?.toIso8601String(),
      'checkOut': instance.checkOut?.toIso8601String(),
      'nights': instance.nights,
      'hotelName': instance.hotelName,
      'category': instance.category,
      'meal': instance.meal,
      'address': instance.address,
      'phone': instance.phone,
      'adults': instance.adults,
      'children': instance.children,
      'incomingOffice': instance.incomingOffice,
      'agencyReferent': instance.agencyReferent,
      'office': instance.office,
      'geocodes': instance.geocodes,
    };

Geocodes _$GeocodesFromJson(Map<String, dynamic> json) => Geocodes(
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$GeocodesToJson(Geocodes instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Office _$OfficeFromJson(Map<String, dynamic> json) => Office(
      id: json['id'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
    };

RoomReserved _$RoomReservedFromJson(Map<String, dynamic> json) => RoomReserved(
      type: json['type'] as String?,
      name: json['name'] as String?,
      passengers: (json['passengers'] as List<dynamic>?)
          ?.map((e) => Passenger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomReservedToJson(RoomReserved instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'passengers': instance.passengers,
    };

Passenger _$PassengerFromJson(Map<String, dynamic> json) => Passenger(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      birthDate: json['birthDate'],
      nationality: json['nationality'],
    );

Map<String, dynamic> _$PassengerToJson(Passenger instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate,
      'nationality': instance.nationality,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
