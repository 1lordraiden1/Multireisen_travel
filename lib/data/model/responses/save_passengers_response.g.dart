// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_passengers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavePassengersResponse _$SavePassengersResponseFromJson(
        Map<String, dynamic> json) =>
    SavePassengersResponse(
      accessToken: json['accessToken'] as String?,
      version: json['version'] as String?,
      serverDate: json['serverDate'] == null
          ? null
          : DateTime.parse(json['serverDate'] as String),
      server: json['server'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SavePassengersResponseToJson(
        SavePassengersResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'version': instance.version,
      'serverDate': instance.serverDate?.toIso8601String(),
      'server': instance.server,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      bookingId: (json['bookingId'] as num?)?.toInt(),
      refundable: json['refundable'] as bool?,
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      messages: json['messages'] as List<dynamic>?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'bookingId': instance.bookingId,
      'refundable': instance.refundable,
      'price': instance.price,
      'messages': instance.messages,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      currency: json['currency'] as String?,
      netTotal: (json['netTotal'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      margin: (json['margin'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      optionalServices: (json['optionalServices'] as num?)?.toInt(),
      paymentFee: (json['paymentFee'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
      priceBreakDown: (json['priceBreakDown'] as List<dynamic>?)
          ?.map((e) => PriceBreakDown.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'currency': instance.currency,
      'netTotal': instance.netTotal,
      'tax': instance.tax,
      'margin': instance.margin,
      'discount': instance.discount,
      'optionalServices': instance.optionalServices,
      'paymentFee': instance.paymentFee,
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
      value: json['value'] is double
          ? (json['value'] as num?)?.toDouble()
          : double.parse(
              (json['value'].toString()),
            ),
    );

Map<String, dynamic> _$TaxBreakDownToJson(TaxBreakDown instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };
