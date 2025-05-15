# Flutter Posts App

A Flutter application that fetches a list of posts from an API, displays them in a `ListView`, supports refresh functionality, shows a loading indicator and error messages, and caches the data locally for offline access.

## ✨ Features

- Display list of posts (title & body)
- Display Input Full Name $ Email
- Display Counter
- Show loading indicator while fetching
- Show error message if fetch fails
- Pull-to-refresh / Refresh button
- Offline support using local cache (SharedPreferences)
- Riverpod state management
- Clean architecture with repository pattern
- Integrated with Dio for API requests

## 📦 Dependencies

- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
- [dio](https://pub.dev/packages/dio)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [injectable](https://pub.dev/packages/injectable)
- [get_it](https://pub.dev/packages/get_it)

## 🧱 Project Structure

```
lib/
├── const/
│   └── messages.dart
├── data/
│   └── posts/
│       └── posts_repository.dart
├── di/
│   ├── di.dart
│   └── register_module.dart
├── models/
│   ├── post_model.dart
│   └── result_resp.dart
├── page/
│   └── posts/
│       ├── posts_page.dart
│       └── posts_provider.dart
├── themes/
│   └── app_colors.dart
└── main.dart
```

## 🚀 Getting Started

1. **Clone the repository**

```bash
git clone https://github.com/yourusername/flutter-posts-app.git
cd flutter-posts-app
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Generate dependency injection code**

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Run the app**

```bash
flutter run
```

## 🧪 Usage

- App will automatically fetch and show posts on launch.
- Press the **Refresh** button to manually refetch.
- Disconnect your internet — app will load the last cached data (if available).

## 📂 API Used

- https://jsonplaceholder.typicode.com/posts

## 📌 TODO

- [x] Show loading and error states
- [x] Refresh data manually
- [x] Save data to local cache
- [x] Load from cache on offline
- [ ] Add pagination
- [ ] Write unit and widget tests

## 📃 License

This project is licensed under the MIT License.
