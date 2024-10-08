// To parse this JSON data, do
//
//     final requestRoom = requestRoomFromJson(jsonString);

import 'dart:convert';

RequestRoom requestRoomFromJson(String str) =>
    RequestRoom.fromJson(json.decode(str));

String requestRoomToJson(RequestRoom data) => json.encode(data.toJson());

class RequestRoom {
  List<RoomItem>? rooms;

  RequestRoom({
    this.rooms,
  });

  factory RequestRoom.fromJson(Map<String, dynamic> json) => RequestRoom(
        rooms: json["rooms"] == null
            ? []
            : List<RoomItem>.from(
                json["rooms"]!.map(
                  (x) => RoomItem.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "rooms": rooms == null
            ? []
            : List<dynamic>.from(
                rooms!.map(
                  (x) => x.toJson(),
                ),
              ),
      };
}

class RoomItem {
  int adults;
  List<int> children; // ages

  RoomItem({
    required this.adults,
    required this.children,
  });

  static int calculateAdultsInRooms(List<RoomItem> requestRooms) {
    int ads = 0;
    for (RoomItem room in requestRooms) {
      ads += room.adults;
    }
    return ads;
  }

  static int calculateChildrenInRooms(List<RoomItem> requestRooms) {
    int cds = 0;
    for (RoomItem room in requestRooms) {
      cds += room.children.length;
    }
    return cds;
  }

  factory RoomItem.fromJson(Map<String, dynamic> json) => RoomItem(
        adults: json["adults"],
        children: json["children"] == null
            ? []
            : List<int>.from(json["children"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "adults": adults,
        "children":
            children == null ? [] : List<dynamic>.from(children.map((x) => x)),
      };
}
