import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final routerProvider = Provider<GoRouter>((ref) {
  bool isSupabaseInitialized = false;
  try {
    isSupabaseInitialized = Supabase.instance.isInitialized;
  } catch (e) {
    isSupabaseInitialized = false;
  }

  return GoRouter(
    initialLocation: isSupabaseInitialized ? '/splash' : '/home',
    redirect: (context, state) {
      if (!isSupabaseInitialized) {
        if (state.matchedLocation == '/splash' || state.matchedLocation.startsWith('/auth')) {
          return '/home';
        }
        return null;
      }

      final supabase = Supabase.instance.client;
      final session = supabase.auth.currentSession;
      final isAuthenticated = session != null;
      final isGoingToAuth = state.matchedLocation.startsWith('/auth');
      final isGoingToSplash = state.matchedLocation == '/splash';

      if (isGoingToSplash) {
        return null;
      }

      if (!isAuthenticated && !isGoingToAuth) {
        return '/auth/login';
      }

      if (isAuthenticated && isGoingToAuth) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/auth/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    ],
  );
});

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Center(child: Text('Login Screen - To be implemented')),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EasyCook')),
      body: const Center(child: Text('Home Screen - To be implemented')),
    );
  }
}
