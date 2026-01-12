# EasyCook - Guide de Configuration

## Prérequis

- Flutter SDK 3.10.7+
- Dart SDK 3.10.7+
- Xcode (pour iOS)
- Compte Supabase

## Installation

### 1. Cloner le projet

```bash
git clone <repository-url>
cd easycook_app
```

### 2. Configuration de l'environnement

Créer le fichier `.env` dans `/mobile`:

```bash
cd mobile
cp .env.example .env
```

Éditer `.env` avec vos credentials Supabase:

```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key-here
```

### 3. Installer les dépendances

```bash
cd mobile
flutter pub get
```

### 4. Générer le code (optionnel)

Si vous utilisez freezed ou json_serializable:

```bash
dart run build_runner build --delete-conflicting-outputs
```

**Note**: Il y a actuellement un conflit de versions avec `analyzer_plugin`.
Les modèles de base utilisent des classes simples sans freezed.

### 5. Lancer l'application

```bash
flutter run
```

## Configuration iOS

### Bundle ID

Le Bundle ID est configuré à `com.EasyCook` dans:
- `mobile/ios/Runner/Info.plist`
- Xcode project settings

### Permissions

Ajouter dans `Info.plist` si nécessaire:
- Camera
- Photo Library
- Notifications

## Configuration Supabase

### 1. Créer un projet Supabase

1. Aller sur [supabase.com](https://supabase.com)
2. Créer un nouveau projet
3. Copier l'URL et l'anon key dans `.env`

### 2. Configuration Auth

- Activer Email/Password auth
- Configurer les redirections si nécessaire

### 3. Database

Les migrations seront dans `/supabase/migrations/`

### 4. Edge Functions

Les fonctions seront dans `/supabase/functions/`

## Structure des Features

Pour créer une nouvelle feature:

```bash
mkdir -p lib/features/my_feature/{presentation,domain,data}
mkdir -p lib/features/my_feature/presentation/{pages,widgets,providers}
mkdir -p lib/features/my_feature/domain/{entities,usecases}
mkdir -p lib/features/my_feature/data/{models,repositories,datasources}
```

## Tests

```bash
flutter test
```

## Build

### iOS
```bash
flutter build ios --release
```

### Android
```bash
flutter build apk --release
```

## Troubleshooting

### Build Runner Errors

Si `build_runner` échoue à cause de conflits de versions:
- Utiliser des classes simples au lieu de freezed temporairement
- Ou mettre à jour les versions de dépendances pour compatibilité

### Supabase Connection

Vérifier que:
- Le fichier `.env` existe et contient les bonnes valeurs
- L'URL Supabase est accessible
- L'anon key est valide
