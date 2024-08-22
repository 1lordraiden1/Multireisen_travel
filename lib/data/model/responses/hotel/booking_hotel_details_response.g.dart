// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_hotel_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingHotelDetailsResponse _$BookingHotelDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    BookingHotelDetailsResponse(
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

Map<String, dynamic> _$BookingHotelDetailsResponseToJson(
        BookingHotelDetailsResponse instance) =>
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
      hotelDetails: json['hotelDetails'] == null
          ? null
          : HotelDetails.fromJson(json['hotelDetails'] as Map<String, dynamic>),
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'properties': instance.properties,
      'hotelDetails': instance.hotelDetails,
      'rooms': instance.rooms,
      'links': instance.links,
    };

HotelDetails _$HotelDetailsFromJson(Map<String, dynamic> json) => HotelDetails(
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

Map<String, dynamic> _$HotelDetailsToJson(HotelDetails instance) =>
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
      checkin: json['checkin'] == null
          ? null
          : DateTime.parse(json['checkin'] as String),
      checkout: json['checkout'] == null
          ? null
          : DateTime.parse(json['checkout'] as String),
      cxlPolicy: json['cxlPolicy'] == null
          ? null
          : CxlPolicy.fromJson(json['cxlPolicy'] as Map<String, dynamic>),
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
      'checkin': instance.checkin?.toIso8601String(),
      'checkout': instance.checkout?.toIso8601String(),
      'cxlPolicy': instance.cxlPolicy,
      'price': instance.price,
      'status': instance.status,
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

PurplePrice _$PurplePriceFromJson(Map<String, dynamic> json) => PurplePrice(
      currency: json['currency'] as String?,
      basePrice: json['basePrice'] as String?,
      tax: json['tax'] as String?,
      margin: json['margin'] as String?,
      discount: json['discount'] as String?,
      optionalServices: json['optionalServices'] as String?,
      fees: json['fees'] as String?,
      total: json['total'] as String?,
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
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      booking: json['booking'] as String?,
      document: json['document'] as String?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'booking': instance.booking,
      'document': instance.document,
    };

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      itemId: json['itemId'] as String?,
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
      additionalFees: json['additionalFees'] as List<dynamic>?,
      priceInfo: json['priceInfo'] as String?,
      sharingBedding: json['sharingBedding'] as bool?,
      remarks:
          (json['remarks'] as List<dynamic>?)?.map((e) => e as String).toList(),
      originalItemId: json['originalItemId'] as String?,
      originalSolutionId: json['originalSolutionId'] as String?,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'name': instance.name,
      'meal': instance.meal,
      'roomtype': instance.roomtype,
      'view': instance.view,
      'additionalFees': instance.additionalFees,
      'priceInfo': instance.priceInfo,
      'sharingBedding': instance.sharingBedding,
      'remarks': instance.remarks,
      'originalItemId': instance.originalItemId,
      'originalSolutionId': instance.originalSolutionId,
    };

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

View _$ViewFromJson(Map<String, dynamic> json) => View(
      code: (json['code'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ViewToJson(View instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
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
      passengers: json['passengers'] as List<dynamic>?,
    );

Map<String, dynamic> _$DataPropertiesToJson(DataProperties instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'created': instance.created?.toIso8601String(),
      'price': instance.price,
      'passengers': instance.passengers,
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
