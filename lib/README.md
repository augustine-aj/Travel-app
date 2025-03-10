```plaintext

lib/
├── core/                     # Core utilities & configurations (unchanging logic)
│   ├── network/
│   │   ├── api_service.dart  # Handles API requests
│   │   ├── dio_client.dart   # Uses Dio for networking
│   │   ├── exceptions.dart   # Custom error handling
│   ├── utils/
│   │   ├── validators.dart   # Form validation utils (e.g., email, password)
│   │   ├── constants.dart    # App-wide constants (e.g., API keys)
│   │   ├── theme.dart        # Centralized theming
│   │   ├── storage.dart      # SharedPreferences/local storage helpers
│   ├── di/
│   │   ├── dependency_injection.dart  # Manages services (GetIt)
│   ├── routes/
│   │   ├── auth_routes.dart   # Auth-specific routes (Login, Signup)
│   │   ├── main_routes.dart   # Other routes (Home, Profile, Orders)
│   │   ├── app_router.dart    # Centralized route configuration
│
├── features/                   # Organized by feature
│   ├── auth/                    # Authentication Module (Login, Signup)
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── auth_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── user_models.dart
│   │   │   ├── repositories/
│   │   │   │   ├── auth_repository_impl.dart  # Handles signup/login API calls
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── user.dart
│   │   │   ├── repositories/
│   │   │   │   ├── auth_repository.dart
│   │   │   ├── usecases/
│   │   │   │   ├── login_usecase.dart
│   │   │   │   ├── signup_usecase.dart
│   │   ├── presentation/
│   │   │   ├── pages/
│   │   │   │   ├── login_page.dart
│   │   │   │   ├── signup_page.dart
│   │   │   ├── blocs/
│   │   │   │   ├── login_blocs.dart
│   │   │   ├── widgets/
│   │   │   │   ├── signup_form.dart
│   │   │   │   ├── login_form.dart
│   │   │   │   ├── signup_form.dart
│   │   │   │   ├── text_field.dart
│   │   │   │   ├── text_from.dart
│   │   │   ├── viewmodels/
│   │   │   │   ├── login_viewmodel.dart
│   │   │   │   ├── signup_viewmodel.dart
│
│   ├── profile/                 # User Profile Module
│   │   ├── data/
│   │   │   ├── models/profile_model.dart
│   │   │   ├── repositories/profile_repository.dart
│   │   ├── domain/
│   │   │   ├── usecases/get_user_profile.dart
│   │   │   ├── usecases/update_user_profile.dart
│   │   ├── presentation/
│   │   │   ├── pages/profile_page.dart
│   │   │   ├── widgets/profile_picture.dart
│   │   │   ├── viewmodels/profile_viewmodel.dart
│
│   ├── orders/                   # Orders Module (for future eCommerce features)
│   │   ├── data/
│   │   │   ├── models/order_model.dart
│   │   │   ├── repositories/order_repository.dart
│   │   ├── domain/
│   │   │   ├── usecases/get_orders.dart
│   │   │   ├── usecases/cancel_order.dart
│   │   ├── presentation/
│   │   │   ├── pages/orders_page.dart
│   │   │   ├── widgets/order_card.dart
│   │   │   ├── viewmodels/orders_viewmodel.dart
│
│   ├── notifications/            # Notifications Module
│   │   ├── data/
│   │   │   ├── models/notification_model.dart
│   │   │   ├── repositories/notification_repository.dart
│   │   ├── domain/
│   │   │   ├── usecases/get_notifications.dart
│   │   ├── presentation/
│   │   │   ├── pages/notifications_page.dart
│   │   │   ├── widgets/notification_item.dart
│   │   │   ├── viewmodels/notification_viewmodel.dart
│
│   ├── chat/                     # Chat Module (for future chat support)
│   │   ├── data/
│   │   │   ├── models/chat_message_model.dart
│   │   │   ├── repositories/chat_repository.dart
│   │   ├── domain/
│   │   │   ├── usecases/send_message.dart
│   │   │   ├── usecases/get_messages.dart
│   │   ├── presentation/
│   │   │   ├── pages/chat_page.dart
│   │   │   ├── widgets/chat_bubble.dart
│   │   │   ├── viewmodels/chat_viewmodel.dart
│
├── main.dart                     # Entry point of the app

```

