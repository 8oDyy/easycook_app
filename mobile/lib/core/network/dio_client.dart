import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DioClient {
  final Dio _dio;
  final SupabaseClient _supabase;

  DioClient({required Dio dio, required SupabaseClient supabase})
    : _dio = dio,
      _supabase = supabase {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final session = _supabase.auth.currentSession;
          if (session != null) {
            options.headers['Authorization'] = 'Bearer ${session.accessToken}';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            final refreshed = await _supabase.auth.refreshSession();
            if (refreshed.session != null) {
              error.requestOptions.headers['Authorization'] =
                  'Bearer ${refreshed.session!.accessToken}';
              return handler.resolve(await _dio.fetch(error.requestOptions));
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Dio get dio => _dio;
}

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
    ),
  );
});

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioProvider);
  final supabase = Supabase.instance.client;
  return DioClient(dio: dio, supabase: supabase);
});
