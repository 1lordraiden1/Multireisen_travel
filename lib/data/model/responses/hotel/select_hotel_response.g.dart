// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_hotel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectHotelResponse _$SelectHotelResponseFromJson(Map<String, dynamic> json) =>
    SelectHotelResponse(
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

Map<String, dynamic> _$SelectHotelResponseToJson(
        SelectHotelResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'version': instance.version,
      'serverDate': instance.serverDate?.toIso8601String(),
      'server': instance.server,
      'data': instance.data,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      itemId: json['itemId'] as String?,
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: json['properties'] == null
          ? null
          : Properties.fromJson(json['properties'] as Map<String, dynamic>),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => DataLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      optionalServices: json['optionalServices'] as bool?,
      requiredFields: (json['requiredFields'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      payModes: (json['payModes'] as List<dynamic>?)
          ?.map((e) => PayMode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'rooms': instance.rooms,
      'properties': instance.properties,
      'links': instance.links,
      'optionalServices': instance.optionalServices,
      'requiredFields': instance.requiredFields,
      'payModes': instance.payModes,
    };

DataLink _$DataLinkFromJson(Map<String, dynamic> json) => DataLink(
      rel: json['rel'] as String?,
      method: json['method'] as String?,
      href: json['href'] as String?,
    );

Map<String, dynamic> _$DataLinkToJson(DataLink instance) => <String, dynamic>{
      'rel': instance.rel,
      'method': instance.method,
      'href': instance.href,
    };

PayMode _$PayModeFromJson(Map<String, dynamic> json) => PayMode(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      price: (json['price'] as num?)?.toInt(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$PayModeToJson(PayMode instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'price': instance.price,
      'currency': instance.currency,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      hotelId: json['hotelId'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      information: json['information'] as List<dynamic>?,
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'hotelId': instance.hotelId,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'category': instance.category,
      'location': instance.location,
      'images': instance.images,
      'facilities': instance.facilities,
      'description': instance.description,
      'information': instance.information,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      numeric: json['numeric'] as String?,
      textual: json['textual'],
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'numeric': instance.numeric,
      'textual': instance.textual,
      'description': instance.description,
    };

Facility _$FacilityFromJson(Map<String, dynamic> json) => Facility(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$FacilityToJson(Facility instance) => <String, dynamic>{
      'text': instance.text,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: json['id'] as String?,
      width: json['width'],
      height: json['height'],
      caption: json['caption'] as String?,
      thumbnail: json['thumbnail'] as bool?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'caption': instance.caption,
      'thumbnail': instance.thumbnail,
      'url': instance.url,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      cityName: json['cityName'] as String?,
      code: json['code'],
      name: json['name'],
      geoCodes: json['geoCodes'] == null
          ? null
          : GeoCodes.fromJson(json['geoCodes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'code': instance.code,
      'name': instance.name,
      'geoCodes': instance.geoCodes,
    };

GeoCodes _$GeoCodesFromJson(Map<String, dynamic> json) => GeoCodes(
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$GeoCodesToJson(GeoCodes instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      itemId: json['itemId'] as String?,
      solutionId: (json['solutionId'] as num?)?.toInt(),
      name: json['name'] as String?,
      meal: json['meal'] == null
          ? null
          : Meal.fromJson(json['meal'] as Map<String, dynamic>),
      roomtype: json['roomtype'] == null
          ? null
          : Meal.fromJson(json['roomtype'] as Map<String, dynamic>),
      view: json['view'] == null
          ? null
          : View.fromJson(json['view'] as Map<String, dynamic>),
      cxlPolicy: json['cxlPolicy'] == null
          ? null
          : CxlPolicy.fromJson(json['cxlPolicy'] as Map<String, dynamic>),
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      additionalFees: json['additionalFees'] as List<dynamic>?,
      priceInfo: json['priceInfo'] as String?,
      sharingBedding: json['sharingBedding'] as bool?,
      remarks:
          (json['remarks'] as List<dynamic>?)?.map((e) => e as String).toList(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => RoomLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      originalItemId: json['originalItemId'] as String?,
      originalSolutionId: (json['originalSolutionId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
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
      'originalItemId': instance.originalItemId,
      'originalSolutionId': instance.originalSolutionId,
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

RoomLink _$RoomLinkFromJson(Map<String, dynamic> json) => RoomLink(
      rel: json['rel'] as String?,
      href: json['href'] as String?,
    );

Map<String, dynamic> _$RoomLinkToJson(RoomLink instance) => <String, dynamic>{
      'rel': instance.rel,
      'href': instance.href,
    };

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      currency: json['currency'] as String?,
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      margin: (json['margin'] as num?)?.toInt(),
      fees: (json['fees'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
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

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
