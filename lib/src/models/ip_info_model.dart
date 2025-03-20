import 'package:ipapi_dart/ipapi_dart.dart';

class IpInfoModel {
  final String ip;
  final ISPInfoModel isp;
  final LocationInfoModel location;
  final RiskInfoModel risk;
  IpInfoModel({required this.ip, required this.isp, required this.location, required this.risk});

  IpInfoModel copyWith({
    String? ip,
    ISPInfoModel? isp,
    LocationInfoModel? location,
    RiskInfoModel? risk,
  }) {
    return IpInfoModel(
      ip: ip ?? this.ip,
      isp: isp ?? this.isp,
      location: location ?? this.location,
      risk: risk ?? this.risk,
    );
  }

  factory IpInfoModel.fromMap(Map<String, dynamic> map) {
    return IpInfoModel(
      ip: map['ip'] as String,
      isp: ISPInfoModel.fromMap(map['isp'] as Map<String, dynamic>),
      location: LocationInfoModel.fromMap(map['location'] as Map<String, dynamic>),
      risk: RiskInfoModel.fromMap(map['risk'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return 'IpInfoModel(ip: $ip, isp: $isp, location: $location, risk: $risk)';
  }

  @override
  bool operator ==(covariant IpInfoModel other) {
    if (identical(this, other)) return true;

    return other.ip == ip && other.isp == isp && other.location == location && other.risk == risk;
  }

  @override
  int get hashCode {
    return ip.hashCode ^ isp.hashCode ^ location.hashCode ^ risk.hashCode;
  }
}
