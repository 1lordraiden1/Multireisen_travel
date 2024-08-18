// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flight _$FlightFromJson(Map<String, dynamic> json) => Flight(
      itemId: json['itemId'] as String?,
      hash: json['hash'] as String?,
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: json['properties'] == null
          ? null
          : Properties.fromJson(json['properties'] as Map<String, dynamic>),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      baggageAllowance: json['baggageAllowance'] as List<dynamic>?,
    );

Map<String, dynamic> _$FlightToJson(Flight instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'hash': instance.hash,
      'price': instance.price,
      'segments': instance.segments,
      'properties': instance.properties,
      'links': instance.links,
      'baggageAllowance': instance.baggageAllowance,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      rel: json['rel'] as String?,
      href: json['href'] as String?,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'rel': instance.rel,
      'href': instance.href,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      currency: json['currency'] as String?,
      basePrice: (json['basePrice'] as num?)?.toInt(),
      tax: (json['tax'] as num?)?.toDouble(),
      margin: (json['margin'] as num?)?.toInt(),
      fees: (json['fees'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
      priceBreakDown: (json['priceBreakDown'] as List<dynamic>?)
          ?.map((e) => PriceBreakDown.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'currency': instance.currency,
      'basePrice': instance.basePrice,
      'tax': instance.tax,
      'margin': instance.margin,
      'fees': instance.fees,
      'total': instance.total,
      'priceBreakDown': instance.priceBreakDown,
    };

PriceBreakDown _$PriceBreakDownFromJson(Map<String, dynamic> json) =>
    PriceBreakDown(
      currency: json['currency'] as String?,
      ptc: json['PTC'] as String?,
      count: (json['count'] as num?)?.toInt(),
      basePrice: (json['basePrice'] as num?)?.toInt(),
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
      value: json['value'] as String?,
    );

Map<String, dynamic> _$TaxBreakDownToJson(TaxBreakDown instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      type: json['type'] as String?,
      lcc: json['lcc'] as bool?,
      privateFare: json['privateFare'] as bool?,
      refundable: json['refundable'] as bool?,
      platingCarrier: json['platingCarrier'] as String?,
      ticketingDeadline: json['ticketingDeadline'] == null
          ? null
          : DateTime.parse(json['ticketingDeadline'] as String),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'type': instance.type,
      'lcc': instance.lcc,
      'privateFare': instance.privateFare,
      'refundable': instance.refundable,
      'platingCarrier': instance.platingCarrier,
      'ticketingDeadline': instance.ticketingDeadline?.toIso8601String(),
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
      baggageAllowance: json['baggageAllowance'] == null
          ? null
          : BaggageAllowance.fromJson(
              json['baggageAllowance'] as Map<String, dynamic>),
      techStops: (json['techStops'] as num?)?.toInt(),
      equipment: json['equipment'],
      flightTime: (json['flightTime'] as num?)?.toInt(),
      journeyTime: (json['journeyTime'] as num?)?.toInt(),
      waitTime: (json['waitTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SegmentToJson(Segment instance) => <String, dynamic>{
      'group': instance.group,
      'class': instance.segmentClass,
      'carrier': instance.carrier,
      'operatingCarrier': instance.operatingCarrier,
      'origin': instance.origin,
      'destination': instance.destination,
      'baggageAllowance': instance.baggageAllowance,
      'techStops': instance.techStops,
      'equipment': instance.equipment,
      'flightTime': instance.flightTime,
      'journeyTime': instance.journeyTime,
      'waitTime': instance.waitTime,
    };

BaggageAllowance _$BaggageAllowanceFromJson(Map<String, dynamic> json) =>
    BaggageAllowance(
      amount: (json['amount'] as num?)?.toInt(),
      unit: (json['unit'] as num?)?.toInt(),
      unitName: json['unitName'] as String?,
    );

Map<String, dynamic> _$BaggageAllowanceToJson(BaggageAllowance instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'unit': instance.unit,
      'unitName': instance.unitName,
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
      terminal: json['terminal'],
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
      name: json['name'] as String?,
      code: json['code'] as String?,
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
