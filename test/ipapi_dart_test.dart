import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ipapi_dart/ipapi_dart.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Generate mocks
import 'ipapi_dart_test.mocks.dart';

void main() {
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    // Replace the static Dio instance with our mock
    IPInfo.dio = mockDio;
  });

  group('IPInfo Tests', () {
    test('queryIP returns a valid IpInfoModel on successful API call', () async {
      // Sample response data that matches the ipquery.io API format
      final Map<String, dynamic> responseData = {
        "ip": "1.1.1.1",
        "isp": {"asn": "AS13335", "org": "Cloudflare, Inc.", "isp": "Cloudflare, Inc."},
        "location": {
          "country": "United States",
          "country_code": "US",
          "city": "Los Angeles",
          "state": "California",
          "zipcode": "90001",
          "latitude": 34.0522,
          "longitude": -118.2437,
          "timezone": "America/Los_Angeles",
          "localtime": "2025-03-20T21:25:31",
        },
        "risk": {
          "is_mobile": false,
          "is_vpn": false,
          "is_tor": false,
          "is_proxy": false,
          "is_datacenter": true,
          "risk_score": 1,
        },
      };

      // Mock response
      final response = Response(
        data: jsonEncode(responseData),
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      // Set up the mock to return the response when get is called
      when(mockDio.get('https://api.ipquery.io/1.1.1.1')).thenAnswer((_) async => response);

      // Call the method
      final result = await IPInfo.queryIP('1.1.1.1');

      // Verify the result matches the expected model
      expect(result, isA<IpInfoModel>());
      expect(result.ip, '1.1.1.1');
      expect(result.location.city, 'Los Angeles');
      expect(result.location.country, 'United States');
      expect(result.isp.org, 'Cloudflare, Inc.');
      expect(result.risk.isDatacenter, true);
    });

    test('queryIP throws exception on API error', () async {
      // Mock a failed response
      when(mockDio.get('https://api.ipquery.io/1.1.1.1')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'API Error',
          type: DioExceptionType.badResponse,
        ),
      );

      // Expect the method to throw an exception
      expect(() => IPInfo.queryIP('1.1.1.1'), throwsA(isA<DioException>()));
    });

    test('QueryOwnIP returns IP string on successful API call', () async {
      // Sample response for own IP
      final response = Response(
        data: jsonEncode("1.1.1.1"),
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      // Set up the mock
      when(mockDio.get('https://api.ipquery.io')).thenAnswer((_) async => response);

      // Call the method
      final result = await IPInfo.QueryOwnIP();

      // Verify result
      expect(result, '1.1.1.1');
    });

    test('QueryOwnIP throws exception on API error', () async {
      // Mock a failed response
      when(mockDio.get('https://api.ipquery.io')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'API Error',
          type: DioExceptionType.badResponse,
        ),
      );

      // Expect the method to throw an exception
      expect(() => IPInfo.QueryOwnIP(), throwsA(isA<DioException>()));
    });
  });
}
