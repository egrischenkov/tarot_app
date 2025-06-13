# 🔮 Tarot App

Welcome to the **Tarot App** – a modular, scalable Flutter application built using **Clean Architecture**, **BLoC**, and **Domain-Driven Design (DDD)** principles.

## 📀 Architecture

The project architecture is fully structured around Clean Architecture with clear separation between layers: `data`, `domain`, `presentation`, and `core`. The design encourages high testability, decoupling, and modularization.

📄 See detailed architecture overview: [docs/architecture.md](docs/architecture.md)

## 📁 Project Structure

```plaintext
lib/
🔺 core/             # Common abstractions, DI, error handling
🔺 features/         # Feature-modular structure
🔺     chat/         # Example feature module
🔺 packages/         # Shared reusable packages
🔺 main.dart         # Entry point
```

## 📆 Local Packages

All reusable packages are placed inside `packages/`, and linked locally via `pubspec.yaml`. Includes:

* `tarot_logger/`
* `tarot_ui_kit/`
* `tarot_analytics/`
* `tarot_rest_client/`

---

## 📚 Documentation

| Section                                                         | Description                                  |
| --------------------------------------------------------------- | -------------------------------------------- |
| [architecture.md](docs/architecture.md)                         | Clean Architecture and layering overview     |
| [assets\_gen.md](docs/assets_gen.md)                            | Guide for working with assets and generation |
| [code\_documentation.md](docs/code_documentation.md)            | How to write and structure code comments     |
| [di.md](docs/di.md)                                             | Dependency injection guidelines (get\_it)    |
| [env.md](docs/env.md)                                           | Environment configs and .env usage           |
| [git\_workflow\_guidelines.md](docs/git_workflow_guidelines.md) | Git flow and branching rules                 |
| [tests.md](docs/tests.md)                                       | Unit, Widget, Integration test standards     |
| [versioning.md](docs/versioning.md)                             | Semantic versioning and release notes        |

---

## 🚀 Getting Started

1. **Install dependencies**:

   ```bash
   make get
   ```

2. **Configure git hooks**:

   ```bash
   make hooks_init
   ```

---

## 🧪 Testing

Run all tests:

```bash
make tests
```

Refer to [tests.md](docs/tests.md) for writing and organizing test cases.

---

## 🧠 Philosophy

* Single responsibility at all levels
* Domain logic is independent of the UI/framework
* Feature-first structure for scalability
* Explicit modeling (no reuse between Model ↔ Entity)

---

For any architecture or implementation questions, check [architecture.md](docs/architecture.md) or open an issue.

---

🔮 *Let the code tell your fortune...*
