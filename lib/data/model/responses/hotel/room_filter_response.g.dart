// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_filter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomFilterResponse _$RoomFilterResponseFromJson(Map<String, dynamic> json) =>
    RoomFilterResponse(
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

Map<String, dynamic> _$RoomFilterResponseToJson(RoomFilterResponse instance) =>
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
      type: json['type'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      properties: json['properties'] == null
          ? null
          : Properties.fromJson(json['properties'] as Map<String, dynamic>),
      filters: json['filters'] == null
          ? null
          : Filters.fromJson(json['filters'] as Map<String, dynamic>),
      entities: (json['entities'] as List<dynamic>?)
          ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'class': instance.dataClass,
      'type': instance.type,
      'status': instance.status,
      'properties': instance.properties,
      'filters': instance.filters,
      'entities': instance.entities,
      'links': instance.links,
    };

Entity _$EntityFromJson(Map<String, dynamic> json) => Entity(
      itemId: json['itemId'] as String?,
      solutionId: (json['solutionId'] as num?)?.toInt(),
      name: json['name'] as String?,
      meal: json['meal'] == null
          ? null
          : EntityMeal.fromJson(json['meal'] as Map<String, dynamic>),
      roomtype: json['roomtype'] == null
          ? null
          : EntityMeal.fromJson(json['roomtype'] as Map<String, dynamic>),
      view: json['view'] == null
          ? null
          : View.fromJson(json['view'] as Map<String, dynamic>),
      cxlPolicy: json['cxlPolicy'] == null
          ? null
          : CxlPolicy.fromJson(json['cxlPolicy'] as Map<String, dynamic>),
      price: json['price'] == null
          ? null
          : EntityPrice.fromJson(json['price'] as Map<String, dynamic>),
      additionalFees: json['additionalFees'] as List<dynamic>?,
      priceInfo: json['priceInfo'] as String?,
      sharingBedding: json['sharingBedding'] as bool?,
      remarks:
          (json['remarks'] as List<dynamic>?)?.map((e) => e as String).toList(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'solutionId': instance.solutionId,
      'name': instance.name,
      'meal': instance.meal,
      'roomtype': instance.roomtype,
      'view': instance.view,
      'cxlPolicy': instance.cxlPolicy,
      'price': instance.price,
      'additionalFees': instance.additionalFees,
      'priceInfo': instance.priceInfo,
      'sharingBedding': instance.sharingBedding,
      'remarks': instance.remarks,
      'links': instance.links,
    };

CxlPolicy _$CxlPolicyFromJson(Map<String, dynamic> json) => CxlPolicy(
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      nonRefundable: json['nonRefundable'] as bool?,
      info: json['info'] as String?,
      conditions: json['conditions'] as List<dynamic>?,
    );

Map<String, dynamic> _$CxlPolicyToJson(CxlPolicy instance) => <String, dynamic>{
      'deadline': instance.deadline?.toIso8601String(),
      'nonRefundable': instance.nonRefundable,
      'info': instance.info,
      'conditions': instance.conditions,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      rel: json['rel'] as String?,
      href: json['href'] as String?,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'rel': instance.rel,
      'href': instance.href,
    };

EntityMeal _$EntityMealFromJson(Map<String, dynamic> json) => EntityMeal(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$EntityMealToJson(EntityMeal instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

EntityPrice _$EntityPriceFromJson(Map<String, dynamic> json) => EntityPrice(
      currency: json['currency'] as String?,
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      margin: (json['margin'] as num?)?.toInt(),
      fees: (json['fees'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EntityPriceToJson(EntityPrice instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'basePrice': instance.basePrice,
      'tax': instance.tax,
      'margin': instance.margin,
      'fees': instance.fees,
      'total': instance.total,
    };

View _$ViewFromJson(Map<String, dynamic> json) => View(
      code: (json['code'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ViewToJson(View instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      price: json['price'] == null
          ? null
          : FiltersPrice.fromJson(json['price'] as Map<String, dynamic>),
      roomtypes: (json['roomtypes'] as List<dynamic>?)
          ?.map((e) => MealElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => MealElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      views: (json['views'] as List<dynamic>?)
          ?.map((e) => MealElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'price': instance.price,
      'roomtypes': instance.roomtypes,
      'meals': instance.meals,
      'views': instance.views,
    };

MealElement _$MealElementFromJson(Map<String, dynamic> json) => MealElement(
      id: (json['id'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$MealElementToJson(MealElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

FiltersPrice _$FiltersPriceFromJson(Map<String, dynamic> json) => FiltersPrice(
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$FiltersPriceToJson(FiltersPrice instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'currency': instance.currency,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      totalcount: (json['totalcount'] as num?)?.toInt(),
      filteredcount: (json['filteredcount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'totalcount': instance.totalcount,
      'filteredcount': instance.filteredcount,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      percent: (json['percent'] as num?)?.toInt(),
      finished: json['finished'] as bool?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'percent': instance.percent,
      'finished': instance.finished,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
