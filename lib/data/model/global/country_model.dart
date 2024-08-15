class Country {
  String? countryCode;
  String? countryName;

  Country({
    this.countryCode,
    this.countryName,
  });

  factory Country.empty() {
    return Country(
      countryCode: '',
      countryName: '',
    );
  }

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryCode: json['CountryCode'],
      countryName: json['CountryName'],
    );
  }

  factory Country.fromHotelJson(Map<String, dynamic> json) {
    return Country(
      countryCode: json['Code'],
      countryName: json['Name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CountryCode': countryCode,
      'CountryName': countryName,
    };
  }

  Map<String, dynamic> toHotelJson() {
    return {
      'Code': countryCode,
      'Name': countryName,
    };
  }
}

class City {
  String? countryCode;
  String? countryName;

  City({
    this.countryCode,
    this.countryName,
  });

  factory City.empty() {
    return City(
      countryCode: '',
      countryName: '',
    );
  }

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      countryCode: json['CountryCode'],
      countryName: json['CountryName'],
    );
  }
  factory City.fromHotelJson(Map<String, dynamic> json) {
    return City(
      countryCode: json['Code'],
      countryName: json['Name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CountryCode': countryCode,
      'CountryName': countryName,
    };
  }

  Map<String, dynamic> toHotelJson() {
    return {
      'Code': countryCode,
      'Name': countryName,
    };
  }
}
