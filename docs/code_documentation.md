## 📎 Code Documentation Guidelines

To ensure code clarity and maintainability, we follow minimal but meaningful documentation practices:

### 📌 General Rules

- **Each class** must have a documentation comment **above its declaration** that clearly explains:
  - its purpose,
  - context of use,
  - and any non-obvious behavior or relationships.
  
- **Fields** should be documented **only if they are complex** (e.g. hold state, interact with other systems, or aren't self-explanatory).

- **Methods** should be documented **only when they contain complex logic** or may be **unclear from their name/signature alone**.

- We avoid redundant or excessive documentation. Code should be self-descriptive by default; comments are for clarification, not repetition.

---

### ✅ Example

```dart
/// Handles the logic for user authentication and session persistence.
///
/// This bloc listens for login, logout, and session refresh events,
/// and exposes the current authentication state. It interacts with
/// [AuthRepository] and emits [AuthState]s.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  /// Auth repository used to interact with the backend API.
  final AuthRepository _authRepository;

  /// Indicates if the user was logged in anonymously.
  final bool _isAnonymous;

  AuthBloc(this._authRepository, this._isAnonymous) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  /// Handles user login logic with error handling and state transition.
  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final user = await _authRepository.login(event.email, event.password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
```

