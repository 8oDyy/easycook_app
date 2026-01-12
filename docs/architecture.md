# EasyCook - Architecture

## Structure du Projet

### Monorepo
```
/
├── mobile/          # Application Flutter
├── supabase/        # Backend Supabase
│   ├── functions/   # Edge Functions (Deno/TS)
│   └── migrations/  # Migrations SQL
└── docs/            # Documentation
```

## Architecture Mobile

### Clean Architecture Feature-First

```
mobile/lib/
├── app/                    # Configuration de l'application
│   ├── app.dart           # Widget racine
│   └── router.dart        # Configuration go_router
├── core/                  # Fonctionnalités partagées
│   ├── network/          # Client HTTP (Dio)
│   ├── storage/          # Stockage sécurisé
│   ├── analytics/        # Service d'analytics
│   ├── error/            # Gestion des erreurs
│   └── utils/            # Utilitaires
└── features/             # Fonctionnalités métier
    └── <feature>/
        ├── presentation/ # UI (pages, widgets, providers)
        ├── domain/       # Logique métier (entities, usecases)
        └── data/         # Sources de données (repositories, models)
```

## Stack Technique

### Frontend (Flutter)
- **State Management**: Riverpod (avec providers pour DI)
- **Routing**: go_router
- **HTTP**: Dio avec intercepteur Authorization Bearer
- **Auth**: supabase_flutter
- **Code Generation**: freezed + json_serializable
- **Secure Storage**: flutter_secure_storage
- **Analytics**: Interface abstraite + implémentation placeholder

### Backend (Supabase)
- **Database**: PostgreSQL avec RLS
- **Auth**: Supabase Auth
- **Functions**: Edge Functions (Deno/TypeScript)

## Principes

1. **Séparation des préoccupations**: Chaque couche a une responsabilité claire
2. **Dependency Injection**: Via Riverpod providers
3. **Testabilité**: Interfaces et abstractions pour faciliter les tests
4. **Type Safety**: Utilisation de sealed classes et pattern matching
5. **Immutabilité**: Modèles immutables (const constructors)

## Flux de Données

```
UI (Presentation)
  ↓ appelle
UseCase (Domain)
  ↓ appelle
Repository (Data)
  ↓ appelle
DataSource (Remote/Local)
```

## Gestion des Erreurs

- Exceptions custom dans la couche data
- Conversion en Failure dans les repositories
- Result<T> pour encapsuler succès/échec
- Affichage des erreurs dans la couche présentation
