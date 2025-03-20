class LocationInfoModel {
  final String country;
  final String country_code;
  final String city;
  final String state;
  final String zipcode;
  final double latitude;
  final double longitude;
  final String timezone;
  final String localtime;
  LocationInfoModel({
    required this.country,
    required this.country_code,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.localtime,
  });

  LocationInfoModel copyWith({
    String? country,
    String? country_code,
    String? city,
    String? state,
    String? zipcode,
    double? latitude,
    double? longitude,
    String? timezone,
    String? localtime,
  }) {
    return LocationInfoModel(
      country: country ?? this.country,
      country_code: country_code ?? this.country_code,
      city: city ?? this.city,
      state: state ?? this.state,
      zipcode: zipcode ?? this.zipcode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timezone: timezone ?? this.timezone,
      localtime: localtime ?? this.localtime,
    );
  }

  factory LocationInfoModel.fromMap(Map<String, dynamic> map) {
    return LocationInfoModel(
      country: map['country'] as String,
      country_code: map['country_code'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      zipcode: map['zipcode'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      timezone: map['timezone'] as String,
      localtime: map['localtime'] as String,
    );
  }

  @override
  String toString() {
    return 'LocationInfoModel(country: $country, country_code: $country_code, city: $city, state: $state, zipcode: $zipcode, latitude: $latitude, longitude: $longitude, timezone: $timezone, localtime: $localtime)';
  }

  @override
  bool operator ==(covariant LocationInfoModel other) {
    if (identical(this, other)) return true;

    return other.country == country &&
        other.country_code == country_code &&
        other.city == city &&
        other.state == state &&
        other.zipcode == zipcode &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.timezone == timezone &&
        other.localtime == localtime;
  }

  @override
  int get hashCode {
    return country.hashCode ^
        country_code.hashCode ^
        city.hashCode ^
        state.hashCode ^
        zipcode.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        timezone.hashCode ^
        localtime.hashCode;
  }
}
