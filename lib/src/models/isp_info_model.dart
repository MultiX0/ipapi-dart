class ISPInfoModel {
  final String asn;
  final String org;
  final String isp;
  ISPInfoModel({required this.asn, required this.org, required this.isp});

  ISPInfoModel copyWith({String? asn, String? org, String? isp}) {
    return ISPInfoModel(asn: asn ?? this.asn, org: org ?? this.org, isp: isp ?? this.isp);
  }

  factory ISPInfoModel.fromMap(Map<String, dynamic> map) {
    return ISPInfoModel(
      asn: map['asn'] as String,
      org: map['org'] as String,
      isp: map['isp'] as String,
    );
  }

  @override
  String toString() => 'ISPInfoModel(asn: $asn, org: $org, isp: $isp)';

  @override
  bool operator ==(covariant ISPInfoModel other) {
    if (identical(this, other)) return true;

    return other.asn == asn && other.org == org && other.isp == isp;
  }

  @override
  int get hashCode => asn.hashCode ^ org.hashCode ^ isp.hashCode;
}
