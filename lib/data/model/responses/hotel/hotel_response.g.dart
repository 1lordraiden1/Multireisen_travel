// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelResponse _$HotelResponseFromJson(Map<String, dynamic> json) =>
    HotelResponse(
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

Map<String, dynamic> _$HotelResponseToJson(HotelResponse instance) =>
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
          : DataProperties.fromJson(json['properties'] as Map<String, dynamic>),
      filters: json['filters'] == null
          ? null
          : Filters.fromJson(json['filters'] as Map<String, dynamic>),
      markers: (json['markers'] as List<dynamic>?)
          ?.map((e) => Marker.fromJson(e as Map<String, dynamic>))
          .toList(),
      entities: (json['entities'] as List<dynamic>?)
          ?.map((e) => Hotel.fromJson(e as Map<String, dynamic>))
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
      'markers': instance.markers,
      'entities': instance.entities,
      'links': instance.links,
    };

Entity _$EntityFromJson(Map<String, dynamic> json) => Entity(
      itemId: json['itemId'] as String?,
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: json['properties'] == null
          ? null
          : EntityProperties.fromJson(
              json['properties'] as Map<String, dynamic>),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'rooms': instance.rooms,
      'properties': instance.properties,
      'links': instance.links,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      rel: json['rel'] as String?,
      href: json['href'] as String?,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'rel': instance.rel,
      'href': instance.href,
    };

EntityProperties _$EntityPropertiesFromJson(Map<String, dynamic> json) =>
    EntityProperties(
      hotelId: json['hotelId'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      category: json['category'] == null
          ? null
          : PropertiesCategory.fromJson(
              json['category'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      information: json['information'] as List<dynamic>?,
    );

Map<String, dynamic> _$EntityPropertiesToJson(EntityProperties instance) =>
    <String, dynamic>{
      'hotelId': instance.hotelId,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'category': instance.category,
      'location': instance.location,
      'images': instance.images,
      'information': instance.information,
    };

PropertiesCategory _$PropertiesCategoryFromJson(Map<String, dynamic> json) =>
    PropertiesCategory(
      numeric: json['numeric'],
      textual: json['textual'],
    );

Map<String, dynamic> _$PropertiesCategoryToJson(PropertiesCategory instance) =>
    <String, dynamic>{
      'numeric': instance.numeric,
      'textual': instance.textual,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: json['id'] as String?,
      width: json['width'] as String?,
      height: json['height'] as String?,
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
          : RoomPrice.fromJson(json['price'] as Map<String, dynamic>),
      additionalFees: json['additionalFees'] as List<dynamic>?,
      priceInfo: json['priceInfo'] as String?,
      sharingBedding: json['sharingBedding'] as bool?,
      remarks: json['remarks'] as List<dynamic>?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
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
      info: json['info'],
      conditions: json['conditions'] as List<dynamic>?,
    );

Map<String, dynamic> _$CxlPolicyToJson(CxlPolicy instance) => <String, dynamic>{
      'deadline': instance.deadline?.toIso8601String(),
      'nonRefundable': instance.nonRefundable,
      'info': instance.info,
      'conditions': instance.conditions,
    };

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

RoomPrice _$RoomPriceFromJson(Map<String, dynamic> json) => RoomPrice(
      currency: json['currency'] as String?,
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toInt(),
      margin: (json['margin'] as num?)?.toInt(),
      fees: (json['fees'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RoomPriceToJson(RoomPrice instance) => <String, dynamic>{
      'currency': instance.currency,
      'basePrice': instance.basePrice,
      'tax': instance.tax,
      'margin': instance.margin,
      'fees': instance.fees,
      'total': instance.total,
    };

View _$ViewFromJson(Map<String, dynamic> json) => View(
      code: json['code'],
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
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'price': instance.price,
      'categories': instance.categories,
    };

CategoryElement _$CategoryElementFromJson(Map<String, dynamic> json) =>
    CategoryElement(
      id: (json['id'] as num?)?.toInt(),
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryElementToJson(CategoryElement instance) =>
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

Marker _$MarkerFromJson(Map<String, dynamic> json) => Marker(
      type: json['type'] as String?,
      itemid: json['itemid'] as String?,
      name: json['name'] as String?,
      geocodes: json['geocodes'] == null
          ? null
          : Geocodes.fromJson(json['geocodes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarkerToJson(Marker instance) => <String, dynamic>{
      'type': instance.type,
      'itemid': instance.itemid,
      'name': instance.name,
      'geocodes': instance.geocodes,
    };

Geocodes _$GeocodesFromJson(Map<String, dynamic> json) => Geocodes(
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
    );

Map<String, dynamic> _$GeocodesToJson(Geocodes instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

DataProperties _$DataPropertiesFromJson(Map<String, dynamic> json) =>
    DataProperties(
      totalcount: (json['totalcount'] as num?)?.toInt(),
      filteredcount: (json['filteredcount'] as num?)?.toInt(),
      displaycount: (json['displaycount'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataPropertiesToJson(DataProperties instance) =>
    <String, dynamic>{
      'totalcount': instance.totalcount,
      'filteredcount': instance.filteredcount,
      'displaycount': instance.displaycount,
      'pages': instance.pages,
      'page': instance.page,
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
