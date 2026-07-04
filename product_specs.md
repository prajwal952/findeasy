# FindEasy: Product Specifications

This document outlines the current capabilities and supported features of the FindEasy MVP (Minimum Viable Product).

## Product Vision
FindEasy is designed to be the ultimate "save it for later" repository. Instead of losing links in various chat apps or having disorganized browser bookmarks, users can share content directly from any app into FindEasy, keeping everything organized in one place.

## Current Features (MVP)

### 1. Universal Sharing (Inbound)
Users can share content from external apps directly into FindEasy using the native iOS/Android Share Sheet.
- **Supported Content Types:**
  - **URLs / Links:** (e.g., YouTube videos, articles, tweets)
  - **Plain Text:** (e.g., quotes, snippets)
  - **Media Files:** (e.g., images, PDFs, videos)

### 2. App States Handling
FindEasy successfully captures shared content regardless of the app's lifecycle state:
- **Foreground/Background:** Captures content instantly if the app is already running in memory.
- **Closed State:** Captures and processes the shared intent when the app is launched cold via a share action.

### 3. Bookmark Dashboard (UI)
- **Empty State:** A beautiful, welcoming empty state that guides new users on how to use the app.
- **Chronological Feed:** Displays all saved bookmarks in a vertical scrolling list, sorted from newest to oldest.
- **Visual Indicators:** Visually distinguishes between URL links and physical files using intuitive icons.
- **Timestamps:** Displays the exact date and time the content was saved.

### 4. Content Interaction
- **Open Links:** Tapping on a saved URL will automatically launch the default web browser to open the link.
- **Delete Items:** Users can easily remove unwanted bookmarks by tapping the trash/delete icon on the item card.

### 5. Offline Capabilities
- **Local Storage:** All bookmarks are saved directly to the device's local storage. The app is fully functional offline (except for opening external URLs).

---

## Planned Future Features (Iterative Roadmap)
To improve the product in future iterations, the following features are considered:
- **Folders & Tagging:** Ability to categorize bookmarks (e.g., "Recipes", "Tech Reads", "Memes").
- **Search & Filter:** A search bar to quickly find specific links or filter by content type (Text vs Image).
- **Rich Link Previews:** Automatically fetch the title, description, and thumbnail of saved URLs instead of just showing the raw link.
- **Cloud Sync:** Allow users to create an account and sync their bookmarks across multiple devices.
- **Bulk Selection:** Select multiple items to delete or move them to folders simultaneously.
