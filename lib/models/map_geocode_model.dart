class MapGeocodeModel {
  final String roadAddress, jibunAddress, englishAddress, addressElements, x, y, distance;

  MapGeocodeModel.fromJson(Map<String, dynamic> json)
      : roadAddress = json['roadAddress'] ?? '',
        jibunAddress = json['jibunAddress'] ?? '',
        englishAddress = json['englishAddress'] ?? '',
        addressElements = json['addressElements'] ?? '',
        x = json['x'] ?? '',
        y = json['y'] ?? '',
        distance = json['distance'] ?? '';

  @override
  String toString() {
    return 'MapGeocodeModel { roadAddress: $roadAddress, jibunAddress: $jibunAddress, englishAddress: $englishAddress, x: $x, y: $y, distance: $distance }';
  }
}
