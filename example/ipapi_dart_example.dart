import 'package:ipapi_dart/ipapi_dart.dart';

void main() async {
  // Example 1: Get your own IP address
  try {
    String myIp = await IPInfo.QueryOwnIP();
    print('My IP address is: $myIp');
  } catch (e) {
    print('Error getting own IP: $e');
  }

  // Example 2: Query information about a specific IP address
  try {
    IpInfoModel cloudflareInfo = await IPInfo.queryIP('1.1.1.1');

    // Print basic information
    print('\n--- Cloudflare DNS IP Information ---');
    print('IP: ${cloudflareInfo.ip}');

    // Print location information
    print('\nLocation:');
    print('Country: ${cloudflareInfo.location.country} (${cloudflareInfo.location.country_code})');
    print('City: ${cloudflareInfo.location.city}, ${cloudflareInfo.location.state}');
    print('Coordinates: ${cloudflareInfo.location.latitude}, ${cloudflareInfo.location.longitude}');
    print('Timezone: ${cloudflareInfo.location.timezone}');

    // Print ISP information
    print('\nNetwork:');
    print('ISP: ${cloudflareInfo.isp.isp}');
    print('Organization: ${cloudflareInfo.isp.org}');
    print('ASN: ${cloudflareInfo.isp.asn}');

    // Print risk assessment
    print('\nRisk Assessment:');
    print('VPN: ${cloudflareInfo.risk.is_vpn ? 'Yes' : 'No'}');
    print('Proxy: ${cloudflareInfo.risk.is_proxy ? 'Yes' : 'No'}');
    print('Tor: ${cloudflareInfo.risk.is_tor ? 'Yes' : 'No'}');
    print('Datacenter: ${cloudflareInfo.risk.isDatacenter ? 'Yes' : 'No'}');
    print('Risk Score: ${cloudflareInfo.risk.risk_score}/10');
  } catch (e) {
    print('Error querying IP information: $e');
  }

  // Example 3: Query information about a mobile IP (example)
  try {
    print('\n--- Querying a different IP ---');
    IpInfoModel mobileIpInfo = await IPInfo.queryIP('203.0.113.1'); // Example IP
    print('IP Type: ${mobileIpInfo.risk.is_mobile ? 'Mobile' : 'Not Mobile'}');
    print('Location: ${mobileIpInfo.location.city}, ${mobileIpInfo.location.country}');
  } catch (e) {
    print('Error querying IP information: $e');
  }
}
