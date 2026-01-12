# EasyCook

Application mobile de cuisine assistée par IA, construite avec Flutter et Supabase.

## 🏗️ Architecture

Monorepo structuré en Clean Architecture feature-first:

```
/
├── mobile/          # Application Flutter
│   ├── lib/
│   │   ├── app/           # Configuration app (routing, theme)
│   │   ├── core/          # Infrastructure partagée
│   │   │   ├── network/   # Client HTTP (Dio + intercepteurs)
│   │   │   ├── storage/   # Stockage sécurisé
│   │   │   ├── analytics/ # Service analytics (interface)
│   │   │   ├── error/     # Gestion des erreurs
│   │   │   └── utils/     # Utilitaires
│   │   └── features/      # Fonctionnalités métier
│   │       └── <feature>/
│   │           ├── presentation/  # UI (pages, widgets, providers)
│   │           ├── domain/        # Logique métier
│   │           └── data/          # Sources de données
│   ├── android/
│   ├── ios/
│   └── test/
├── supabase/        # Backend
│   ├── functions/   # Edge Functions (Deno/TS)
│   └── migrations/  # Migrations SQL
└── docs/            # Documentation
```

## 🚀 Stack Technique

### Frontend
- **Framework**: Flutter 3.10.7+
- **State Management**: Riverpod (providers + DI)
- **Routing**: go_router
- **HTTP Client**: Dio avec intercepteur Bearer token
- **Auth**: supabase_flutter
- **Secure Storage**: flutter_secure_storage
- **Code Generation**: freezed + json_serializable (optionnel)
- **Analytics**: Interface abstraite + implémentation placeholder

### Backend
- **Database**: Supabase PostgreSQL + RLS
- **Auth**: Supabase Auth
- **Functions**: Edge Functions (Deno/TypeScript)

## 📦 Installation

### Prérequis
- Flutter SDK 3.10.7+
- Dart SDK 3.10.7+
- Xcode (pour iOS)
- Compte Supabase

### Configuration

1. **Cloner le projet**
```bash
git clone <repository-url>
cd easycook_app
```

2. **Configurer l'environnement**
```bash
cd mobile
cp .env.example .env
```

Éditer `.env` avec vos credentials Supabase:
```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key-here
```

3. **Installer les dépendances**
```bash
flutter pub get
```

4. **Lancer l'application**
```bash
flutter run
```

## 🧪 Tests

```bash
flutter test
```

## 📱 Build

### iOS
```bash
flutter build ios --release
```

### Android
```bash
flutter build apk --release
```

## 📚 Documentation

- [Architecture détaillée](docs/architecture.md)
- [Guide de configuration](docs/setup.md)

## 🎯 Principes

- **Clean Architecture**: Séparation claire des responsabilités
- **Feature-First**: Organisation par fonctionnalité métier
- **Dependency Injection**: Via Riverpod providers
- **Type Safety**: Sealed classes et pattern matching
- **Testabilité**: Interfaces et abstractions

## 📝 Notes

- Bundle ID: `com.EasyCook`
- Cible initiale: iOS (code portable Android)
- Les modèles utilisent des classes simples (pas de freezed pour éviter les conflits de versions)

## 🔧 Troubleshooting

Voir [docs/setup.md](docs/setup.md) pour les problèmes courants et leurs solutions.
