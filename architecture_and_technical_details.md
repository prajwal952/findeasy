# FindEasy: Architecture & Technical Specifications

This document outlines the architecture, design choices, and technical specifications for the FindEasy application.

## Overview
FindEasy is a cross-platform mobile application built using **Flutter**. Its primary purpose is to act as a centralized repository for bookmarks, links, images, PDFs, and other media shared from various apps (like Chrome, YouTube, Instagram) via the native OS sharing mechanism.

## Tech Stack
- **Framework:** Flutter (Dart)
- **Local Storage:** `shared_preferences`
- **Native Integrations:** `receive_sharing_intent` (for Share Sheet integration), `url_launcher` (for opening saved links)
- **State Management:** Stateful Widgets (Standard Flutter `setState`), chosen for simplicity in the MVP.

## Architecture Pattern

FindEasy follows a simple **Layered Architecture (MVP approach)** to separate UI logic from business/data logic:

1. **Presentation Layer (UI):** 
   - Found in `lib/screens/home_screen.dart`.
   - Responsible for rendering the UI and handling user interactions.
   - Listens to incoming streams from the OS for shared content.
   
2. **Business/Service Layer:**
   - Found in `lib/services/storage_service.dart`.
   - Abstracts the data persistence layer. UI components interact with this service to fetch, save, or delete bookmarks.

3. **Data/Model Layer:**
   - Found in `lib/models/bookmark.dart`.
   - Contains the `Bookmark` entity and its JSON serialization/deserialization logic.

## Key Technical Workflows

### 1. Intercepting Share Intents
The core functionality relies on native OS share extensions.
- **Android:** The `AndroidManifest.xml` is configured with `android.intent.action.SEND` and `android.intent.action.SEND_MULTIPLE` intent filters. When an external app triggers a share action, Android recognizes FindEasy as an eligible target.
- **iOS:** `Info.plist` is configured with a custom `AppGroupId` and `CFBundleURLTypes`. A Share Extension acts as the bridge between the iOS Share Sheet and the Flutter app.
- **Flutter Handling:** The `receive_sharing_intent` plugin listens to these native intents. The `HomeScreen` subscribes to both text/URL streams and media file streams during `initState()`.

### 2. Data Persistence
For the MVP, we use `shared_preferences` to store data as stringified JSON lists.
- **Serialization:** When a bookmark is saved, it is converted to a `Map` and then encoded to a JSON string.
- **Deserialization:** On app load, the JSON strings are decoded back into `Bookmark` objects and sorted by timestamp (newest first).

### 3. CI/CD & Automated Builds
To circumvent local Android SDK requirements and ensure consistent builds, FindEasy uses **GitHub Actions** for Continuous Integration.
- **Workflow:** `.github/workflows/build_apk.yml` automatically triggers on pushes to the `main` branch.
- **Environment:** Sets up Java 17 and Flutter `stable` on an `ubuntu-latest` runner.
- **Artifact:** Generates a release APK and uploads it as a workflow artifact, making it instantly downloadable for testing without needing a local build environment.

## Design System & Aesthetics
- **Theme:** Clean, modern, and minimalist (Glassmorphism inspired).
- **Colors:** Dominant colors include a very light grey/blue background (`#F5F7FA`), white cards, and vibrant blue accents (`#3B82F6`).
- **Typography:** Uses modern sans-serif aesthetics (Inter).

## Future Scalability
As the app grows, the following architectural upgrades are recommended:
1. **State Management:** Migrate from `setState` to Riverpod or Provider for better scalability when adding folders/tags.
2. **Database:** Migrate from `shared_preferences` to SQLite (via `sqflite`) or a local NoSQL database (like `Hive` or `Isar`) to support complex queries (e.g., searching, filtering by tags).
3. **Cloud Sync:** Integrate Firebase Firestore or Supabase for cross-device synchronization.
