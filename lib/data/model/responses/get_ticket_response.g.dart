// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ticket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTicketResponse _$GetTicketResponseFromJson(Map<String, dynamic> json) =>
    GetTicketResponse(
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

Map<String, dynamic> _$GetTicketResponseToJson(GetTicketResponse instance) =>
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
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
          .toList(),
      passengers: (json['passengers'] as List<dynamic>?)
          ?.map((e) => Passenger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'class': instance.dataClass,
      'properties': instance.properties,
      'segments': instance.segments,
      'passengers': instance.passengers,
    };

Passenger _$PassengerFromJson(Map<String, dynamic> json) => Passenger(
      id: json['id'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      nationality: json['nationality'] as String?,
      passport: json['passport'] == null
          ? null
          : Passport.fromJson(json['passport'] as Map<String, dynamic>),
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PassengerToJson(Passenger instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate?.toIso8601String(),
      'nationality': instance.nationality,
      'passport': instance.passport,
      'services': instance.services,
    };

Passport _$PassportFromJson(Map<String, dynamic> json) => Passport(
      type: json['type'] as String?,
      number: json['number'] as String?,
      expiry: json['expiry'] == null
          ? null
          : DateTime.parse(json['expiry'] as String),
      issueCountry: json['issueCountry'] as String?,
    );

Map<String, dynamic> _$PassportToJson(Passport instance) => <String, dynamic>{
      'type': instance.type,
      'number': instance.number,
      'expiry': instance.expiry?.toIso8601String(),
      'issueCountry': instance.issueCountry,
    };

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: json['id'] as String?,
      type: (json['type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      reservationCode: json['reservationCode'] as String?,
      providerReservationCode: json['providerReservationCode'],
      airlineReservationCode: json['airlineReservationCode'] as String?,
      iatAnumber: json['IATAnumber'],
      agencyCode: json['agencyCode'],
      pcc: json['PCC'],
      issued: json['issued'] == null
          ? null
          : DateTime.parse(json['issued'] as String),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'reservationCode': instance.reservationCode,
      'providerReservationCode': instance.providerReservationCode,
      'airlineReservationCode': instance.airlineReservationCode,
      'IATAnumber': instance.iatAnumber,
      'agencyCode': instance.agencyCode,
      'PCC': instance.pcc,
      'issued': instance.issued?.toIso8601String(),
    };

Segment _$SegmentFromJson(Map<String, dynamic> json) => Segment(
      group: (json['group'] as num?)?.toInt(),
      segmentClass: json['class'] == null
          ? null
          : Class.fromJson(json['class'] as Map<String, dynamic>),
      carrier: json['carrier'] == null
          ? null
          : Carrier.fromJson(json['carrier'] as Map<String, dynamic>),
      operatingCarrier: json['operatingCarrier'] == null
          ? null
          : Carrier.fromJson(json['operatingCarrier'] as Map<String, dynamic>),
      origin: json['origin'] == null
          ? null
          : Destination.fromJson(json['origin'] as Map<String, dynamic>),
      destination: json['destination'] == null
          ? null
          : Destination.fromJson(json['destination'] as Map<String, dynamic>),
      techStops: (json['techStops'] as num?)?.toInt(),
      equipment: json['equipment'],
      flightTime: (json['flightTime'] as num?)?.toInt(),
      journeyTime: (json['journeyTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SegmentToJson(Segment instance) => <String, dynamic>{
      'group': instance.group,
      'class': instance.segmentClass,
      'carrier': instance.carrier,
      'operatingCarrier': instance.operatingCarrier,
      'origin': instance.origin,
      'destination': instance.destination,
      'techStops': instance.techStops,
      'equipment': instance.equipment,
      'flightTime': instance.flightTime,
      'journeyTime': instance.journeyTime,
    };

Carrier _$CarrierFromJson(Map<String, dynamic> json) => Carrier(
      code: json['code'] as String?,
      name: json['name'] as String?,
      flightNumber: json['flightNumber'] as String?,
    );

Map<String, dynamic> _$CarrierToJson(Carrier instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'flightNumber': instance.flightNumber,
    };

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
      code: json['code'] as String?,
      name: json['name'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      time: json['time'] as String?,
      terminal: json['terminal'] as String?,
    );

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'date': instance.date?.toIso8601String(),
      'time': instance.time,
      'terminal': instance.terminal,
    };

Class _$ClassFromJson(Map<String, dynamic> json) => Class(
      name: json['name'],
      code: json['code'],
      bookingCode: json['bookingCode'],
      availableSeats: (json['availableSeats'] as num?)?.toInt(),
      originalname: json['originalname'] as String?,
    );

Map<String, dynamic> _$ClassToJson(Class instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'bookingCode': instance.bookingCode,
      'availableSeats': instance.availableSeats,
      'originalname': instance.originalname,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
