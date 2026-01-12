import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AnalyticsService {
  Future<void> logEvent(String name, {Map<String, dynamic>? parameters});
  Future<void> setUserId(String? userId);
  Future<void> setUserProperty(String name, String? value);
}

class PlaceholderAnalyticsService implements AnalyticsService {
  @override
  Future<void> logEvent(String name, {Map<String, dynamic>? parameters}) async {
    return;
  }

  @override
  Future<void> setUserId(String? userId) async {
    return;
  }

  @override
  Future<void> setUserProperty(String name, String? value) async {
    return;
  }
}

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  return PlaceholderAnalyticsService();
});
