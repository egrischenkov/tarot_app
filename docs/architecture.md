# 📊 Flutter Project Architecture Documentation (Clean Architecture + BLoC)

The architecture in this project strictly follows the principles of **Clean Architecture** with a touch of **Domain-Driven Design (DDD)**. UI state management is handled using **BLoC**.

![tarot\_architecture.png](https://cdn2.buildin.ai/s3/93af0a7c-0caf-4a81-a98c-48481a6ca1b9/tarot_architecture.png?time=1749828600\&token=e9aff9b24f487b13ca3b0bf7a650b85b\&role=free)

## 📁 Project Structure

```plaintext
project_root/
├── lib/                         # Main application code
│   ├── core/                    # Common abstractions, errors, utils, DI
│   │   ├── error/
│   │   ├── usecase/
│   │   ├── utils/
│   │   └── di/
│   │
│   ├── features/                # Feature modules of the application
│   │   └── chat/                # Example feature: Chat
│   │       ├── data/
│   │       │   ├── models/      # DTO models (MessageModel)
│   │       │   ├── data_sources/
│   │       │   └── repositories_impl/
│   │       ├── domain/
│   │       │   ├── entities/    # Business entities (Message)
│   │       │   ├── usecases/    # Use Cases (SendMessage)
│   │       │   └── repositories/# Repository interfaces
│   │       └── presentation/
│   │           ├── bloc/        # BLoC + Events + States
│   │           └── screens/     # UI screens and widgets
│   │
│   └── main.dart                # Application entry point
│
├── packages/                    # Local reusable Dart packages
│   ├── logger/                  # Logging wrapper
│   ├── ui_kit/                  # Common widgets, themes
│   ├── analytics/               # Analytics interface (Firebase, Sentry)
│   └── rest_client/             # HTTP client abstraction (e.g., Dio)
```

## ⚙️ Architectural Principles

* **Clean Architecture**: layered separation — Data, Domain, Presentation
* **Unidirectional data flow**: UI → Bloc → UseCase → Repository → DataSource → API and back
* **Entity ≠ Model**: business entities are infrastructure-agnostic
* **UseCase = one operation**: encapsulates single business logic unit

---

## 📦 Architecture Layers & Responsibilities

### 1. Core

* Common components: `Failure`, `UseCase`, `NetworkInfo`, `Constants`, DI, Routing
* Located in `lib/core/`

### 2. Data

* `models/`: DTOs for serialization (e.g., `MessageModel`)
* `data_sources/`: APIs, databases, caches, etc.
* `repositories_impl/`: map Model ↔ Entity and implement repository logic

### 3. Domain

* `entities/`: business domain entities (e.g., `Message`)
* `usecases/`: business logic operations implementing `UseCase`
* `repositories/`: repository interfaces/abstractions

### 4. Presentation

* `bloc/`: Bloc + Events + States, bridge between UI and UseCase
* `widgets/`: reusable UI components, shared layout logic
* `screens/`: visual application screens

---

## 🧠 What is DDD (Domain-Driven Design)?

**DDD** is a design approach focusing on the **domain (business logic)** over technical concerns.

* **Entity**: object with identity and long-lived lifecycle (e.g., `User`, `Order`)
* **Value Object**: no identity, defined by its value (e.g., `Money`, `EmailAddress`)
* **Use Case / Application Service**: implements system behavior via entities and repositories
* **Repository**: abstraction layer to access data (e.g., get user by ID)

> In Flutter, we apply DDD principles mainly inside the **domain layer**, keeping it framework-independent.

---

## ✅ Recommendations

* **Bloc always belongs in presentation**: it depends on Flutter and UI state

* **UseCase = 1 operation**: prefer 100 small use cases over 1 large monolith

  Reasons:

  * Testability: easier to test isolated logic
  * Maintainability: easier to understand each operation
  * Reusability: can reuse in different contexts
  * Readability: self-documenting names (e.g., `GetUserProfile`, `SendMessage`)

* **Don't reuse models across layers**: Model ≠ Entity

* **Entities must not depend on Flutter, Dio, Hive, etc.**

* Use `Either` from `dartz` (or similar) for error handling

---

## ✍️ Example

```dart
// UseCase
class SendMessageUseCase implements UseCase<SomeData, SendMessageParams> {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  @override
  Future<SomeData> call(SendMessageParams params) async {
    if (params.text.trim().isEmpty) return Left(ValidationFailure("Empty text"));
    return await repository.sendMessage(params.conversationId, params.text);
  }
}

// Bloc
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessageUseCase sendMessage;

  ChatBloc(this.sendMessage) : super(ChatInitial()) {
    on<SendMessagePressed>((event, emit) async {
      await _onSendMessagePressed(event, emit);
    });
  }

  Future<void> _onSendMessagePressed(SendMessagePressed event,
    Emitter<ChatState> emit,) async {
    try {
      emit(ChatState.loading());
      await sendMessage(SendMessageParams(
        conversationId: event.conversationId,
        text: event.messageText,
      ));
    } catch (e, s) {
      addError(e, s);
      emit(const ChatState.error());
    }
  }
}
```
