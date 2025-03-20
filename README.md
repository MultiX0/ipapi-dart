# IPApi Dart

A lightweight Dart package for retrieving IP address information using the [IPQuery.io](https://ipquery.io) API service.

## Features

- Retrieve detailed information about any IP address
- Get your own IP address
- Access location data (country, city, coordinates)
- Access ISP/network information
- Get risk assessment data (VPN detection, proxy detection, Tor exit node detection)
- Simple API with Future-based calls
- Built with Dio for efficient HTTP requests

## Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  ipapi_dart: ^0.0.1
```

Then run:

```bash
dart pub get
```

## Usage

### Import the package

```dart
import 'package:ipapi_dart/ipapi_dart.dart';
```

### Getting your own IP address

```dart
String myIp = await IPInfo.QueryOwnIP();
print('My IP address is: $myIp');
```

### Getting information about a specific IP

```dart
IpInfoModel ipInfo = await IPInfo.queryIP('1.1.1.1');

// Access information from the model
print('IP: ${ipInfo.ip}');
print('Country: ${ipInfo.location.country}');
print('City: ${ipInfo.location.city}');
print('ISP: ${ipInfo.isp.isp}');
```

### Complete example

```dart
import 'package:ipapi_dart/ipapi_dart.dart';

void main() async {
  try {
    // Get your own IP
    String myIp = await IPInfo.QueryOwnIP();
    print('My IP address is: $myIp');
    
    // Query information about a specific IP
    IpInfoModel cloudflareInfo = await IPInfo.queryIP('1.1.1.1');
    
    // Print location information
    print('Country: ${cloudflareInfo.location.country} (${cloudflareInfo.location.countryCode})');
    print('City: ${cloudflareInfo.location.city}, ${cloudflareInfo.location.state}');
    print('Coordinates: ${cloudflareInfo.location.latitude}, ${cloudflareInfo.location.longitude}');
    
    // Print risk assessment
    print('VPN: ${cloudflareInfo.risk.isVpn ? 'Yes' : 'No'}');
    print('Proxy: ${cloudflareInfo.risk.isProxy ? 'Yes' : 'No'}');
    print('Risk Score: ${cloudflareInfo.risk.riskScore}/10');
  } catch (e) {
    print('Error: $e');
  }
}
```

## API Response Model

The API returns data in the following structure:

```json
{
  "ip": "1.1.1.1",
  "isp": {
    "asn": "AS13335",
    "org": "Cloudflare, Inc.",
    "isp": "Cloudflare, Inc."
  },
  "location": {
    "country": "United States",
    "country_code": "US",
    "city": "Los Angeles",
    "state": "California",
    "zipcode": "90001",
    "latitude": 34.0522,
    "longitude": -118.2437,
    "timezone": "America/Los_Angeles",
    "localtime": "2025-03-20T21:25:31"
  },
  "risk": {
    "is_mobile": false,
    "is_vpn": false,
    "is_tor": false,
    "is_proxy": false,
    "is_datacenter": true,
    "risk_score": 1
  }
}
```

## Model Structure

### IpInfoModel

Main class that contains all IP information:

```dart
class IpInfoModel {
  final String ip;
  final ISPInfoModel isp;
  final LocationInfoModel location;
  final RiskInfoModel risk;
  
  // Constructor and fromMap methods
}
```

### LocationInfo

Contains geographical information:

```dart
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
  
  // Constructor and fromMap methods
}
```

### IspInfo

Contains network provider information:

```dart
class ISPInfoModel {
  final String asn;
  final String org;
  final String isp;
  
  // Constructor and fromMap methods
}
```

### RiskInfo

Contains security and risk information:

```dart
class RiskInfoModel {
  final bool is_mobile;
  final bool is_vpn;
  final bool is_tor;
  final bool is_proxy;
  final bool isDatacenter;
  final int risk_score;
  
  // Constructor and fromMap methods
}
```

## Error Handling

The package throws exceptions when API calls fail. Always wrap API calls in try-catch blocks:

```dart
try {
  IpInfoModel ipInfo = await IPInfo.queryIP('1.1.1.1');
  // Process data
} catch (e) {
  // Handle error
  print('Error: $e');
}
```

## API Limits

This package uses the [IPQuery.io](https://ipquery.io) service, which may have rate limits or require an API key for extended usage. Please check their website for the latest information on usage limits.

## Credits

This package is a Dart wrapper for the [IPQuery.io](https://ipquery.io) API. The original API service is maintained by [IPQwery](https://github.com/ipqwery).

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request