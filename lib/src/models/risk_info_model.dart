class RiskInfoModel {
  final bool is_mobile;
  final bool is_vpn;
  final bool is_tor;
  final bool is_proxy;
  final bool isDatacenter;
  final int risk_score;
  RiskInfoModel({
    required this.is_mobile,
    required this.is_vpn,
    required this.is_tor,
    required this.is_proxy,
    required this.isDatacenter,
    required this.risk_score,
  });

  RiskInfoModel copyWith({
    bool? is_mobile,
    bool? is_vpn,
    bool? is_tor,
    bool? is_proxy,
    bool? isDatacenter,
    int? risk_score,
  }) {
    return RiskInfoModel(
      is_mobile: is_mobile ?? this.is_mobile,
      is_vpn: is_vpn ?? this.is_vpn,
      is_tor: is_tor ?? this.is_tor,
      is_proxy: is_proxy ?? this.is_proxy,
      isDatacenter: isDatacenter ?? this.isDatacenter,
      risk_score: risk_score ?? this.risk_score,
    );
  }

  factory RiskInfoModel.fromMap(Map<String, dynamic> map) {
    return RiskInfoModel(
      is_mobile: map['is_mobile'] as bool,
      is_vpn: map['is_vpn'] as bool,
      is_tor: map['is_tor'] as bool,
      is_proxy: map['is_proxy'] as bool,
      isDatacenter: map['is_datacenter'] as bool,
      risk_score: map['risk_score'] as int,
    );
  }

  @override
  String toString() {
    return 'RiskInfoModel(is_mobile: $is_mobile, is_vpn: $is_vpn, is_tor: $is_tor, is_proxy: $is_proxy, is_datacenter: $isDatacenter, risk_score: $risk_score)';
  }

  @override
  bool operator ==(covariant RiskInfoModel other) {
    if (identical(this, other)) return true;

    return other.is_mobile == is_mobile &&
        other.is_vpn == is_vpn &&
        other.is_tor == is_tor &&
        other.is_proxy == is_proxy &&
        other.isDatacenter == isDatacenter &&
        other.risk_score == risk_score;
  }

  @override
  int get hashCode {
    return is_mobile.hashCode ^
        is_vpn.hashCode ^
        is_tor.hashCode ^
        is_proxy.hashCode ^
        isDatacenter.hashCode ^
        risk_score.hashCode;
  }
}
