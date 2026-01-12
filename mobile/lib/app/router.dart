import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/presentation/screens/main_shell_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/discover/presentation/screens/discover_screen.dart';
import '../features/ai_generate/presentation/screens/ai_generate_screen.dart';
import '../features/favorites/presentation/screens/favorites_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';

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
      GoRoute(
        path: '/ai-generate',
        builder: (context, state) => const AiGenerateScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          int currentIndex = 0;
          switch (state.matchedLocation) {
            case '/home':
              currentIndex = 0;
              break;
            case '/discover':
              currentIndex = 1;
              break;
            case '/favorites':
              currentIndex = 3;
              break;
            case '/profile':
              currentIndex = 4;
              break;
          }
          return MainShellScreen(currentIndex: currentIndex, child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/discover',
            builder: (context, state) => const DiscoverScreen(),
          ),
          GoRoute(
            path: '/favorites',
            builder: (context, state) => const FavoritesScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
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
