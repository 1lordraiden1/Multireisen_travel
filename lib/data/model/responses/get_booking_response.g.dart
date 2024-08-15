// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookingResponse _$GetBookingResponseFromJson(Map<String, dynamic> json) =>
    GetBookingResponse(
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

Map<String, dynamic> _$GetBookingResponseToJson(GetBookingResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'version': instance.version,
      'serverDate': instance.serverDate?.toIso8601String(),
      'server': instance.server,
      'data': instance.data,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      properties: json['properties'] == null
          ? null
          : DataProperties.fromJson(json['properties'] as Map<String, dynamic>),
      entities: (json['entities'] as List<dynamic>?)
          ?.map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'properties': instance.properties,
      'entities': instance.entities,
    };

Entity _$EntityFromJson(Map<String, dynamic> json) => Entity(
      properties: json['properties'] == null
          ? null
          : EntityProperties.fromJson(
              json['properties'] as Map<String, dynamic>),
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
          .toList(),
      rules: json['rules'] as List<dynamic>?,
      baggageAllowance: json['baggageAllowance'] as List<dynamic>?,
      supplierInfo: (json['supplierInfo'] as List<dynamic>?)
          ?.map((e) => SupplierInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'properties': instance.properties,
      'segments': instance.segments,
      'rules': instance.rules,
      'baggageAllowance': instance.baggageAllowance,
      'supplierInfo': instance.supplierInfo,
      'links': instance.links,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      rel: json['rel'] as String?,
      method: json['method'] as String?,
      href: json['href'] as String?,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'rel': instance.rel,
      'method': instance.method,
      'href': instance.href,
    };

EntityProperties _$EntityPropertiesFromJson(Map<String, dynamic> json) =>
    EntityProperties(
      bookingItemId: json['bookingItemId'] as String?,
      type: json['type'] as String?,
      bookingNumber: json['bookingNumber'] as String?,
      number: json['number'] as String?,
      lcc: json['lcc'] as bool?,
      refundable: json['refundable'] as bool?,
      platingCarrier: json['platingCarrier'] as String?,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      price: json['price'] == null
          ? null
          : PurplePrice.fromJson(json['price'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EntityPropertiesToJson(EntityProperties instance) =>
    <String, dynamic>{
      'bookingItemId': instance.bookingItemId,
      'type': instance.type,
      'bookingNumber': instance.bookingNumber,
      'number': instance.number,
      'lcc': instance.lcc,
      'refundable': instance.refundable,
      'platingCarrier': instance.platingCarrier,
      'deadline': instance.deadline?.toIso8601String(),
      'price': instance.price,
      'status': instance.status,
    };

PurplePrice _$PurplePriceFromJson(Map<String, dynamic> json) => PurplePrice(
      currency: json['currency'] as String?,
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      margin: (json['margin'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      optionalServices: (json['optionalServices'] as num?)?.toInt(),
      fees: (json['fees'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      priceBreakDown: (json['priceBreakDown'] as List<dynamic>?)
          ?.map((e) => PriceBreakDown.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PurplePriceToJson(PurplePrice instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'basePrice': instance.basePrice,
      'tax': instance.tax,
      'margin': instance.margin,
      'discount': instance.discount,
      'optionalServices': instance.optionalServices,
      'fees': instance.fees,
      'total': instance.total,
      'priceBreakDown': instance.priceBreakDown,
    };

PriceBreakDown _$PriceBreakDownFromJson(Map<String, dynamic> json) =>
    PriceBreakDown(
      currency: json['currency'] as String?,
      ptc: json['PTC'] as String?,
      count: (json['count'] as num?)?.toInt(),
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      margin: (json['margin'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
      taxBreakDown: (json['taxBreakDown'] as List<dynamic>?)
          ?.map((e) => TaxBreakDown.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PriceBreakDownToJson(PriceBreakDown instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'PTC': instance.ptc,
      'count': instance.count,
      'basePrice': instance.basePrice,
      'tax': instance.tax,
      'margin': instance.margin,
      'total': instance.total,
      'taxBreakDown': instance.taxBreakDown,
    };

TaxBreakDown _$TaxBreakDownFromJson(Map<String, dynamic> json) => TaxBreakDown(
      id: (json['id'] as num?)?.toInt(),
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TaxBreakDownToJson(TaxBreakDown instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      booking: json['booking'] as String?,
      document: json['document'] as String?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'booking': instance.booking,
      'document': instance.document,
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

SupplierInfo _$SupplierInfoFromJson(Map<String, dynamic> json) => SupplierInfo(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$SupplierInfoToJson(SupplierInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataProperties _$DataPropertiesFromJson(Map<String, dynamic> json) =>
    DataProperties(
      bookingId: json['bookingId'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      price: json['price'] == null
          ? null
          : FluffyPrice.fromJson(json['price'] as Map<String, dynamic>),
      passengers: (json['passengers'] as List<dynamic>?)
          ?.map((e) => Passenger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataPropertiesToJson(DataProperties instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'created': instance.created?.toIso8601String(),
      'price': instance.price,
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
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
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
      'options': instance.options,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      value: (json['value'] as num?)?.toInt(),
      bags: json['bags'] as String?,
      maxweight: json['maxweight'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'value': instance.value,
      'bags': instance.bags,
      'maxweight': instance.maxweight,
      'id': instance.id,
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

FluffyPrice _$FluffyPriceFromJson(Map<String, dynamic> json) => FluffyPrice(
      currency: json['currency'] as String?,
      net: json['net'] as String?,
      margin: json['margin'] as String?,
      discount: json['discount'] as String?,
      paymentFee: json['paymentFee'] as String?,
      total: json['total'] as String?,
    );

Map<String, dynamic> _$FluffyPriceToJson(FluffyPrice instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'net': instance.net,
      'margin': instance.margin,
      'discount': instance.discount,
      'paymentFee': instance.paymentFee,
      'total': instance.total,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
