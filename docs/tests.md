# 🧪 Testing Guidelines

This project follows a strict testing policy to ensure maintainable and reliable code.

---

## ✅ Required Test Coverage

| Layer                                                                   | Testing Required? | Notes                                      |
| ----------------------------------------------------------------------- | ----------------- | ------------------------------------------ |
| **Business Logic (blocs, services, utils, repositories, data sources)** | ✅ **Yes**         | Must be covered by **unit tests**          |
| **UI components (UI Kit)**                                              | ✅ **Yes**         | Must be covered by **native golden tests** |
| **Other Features**                                                      | As needed         | Prefer testing logic-heavy parts           |

---

## 📚 Testing Principles

All unit tests **must follow** the practices described in:

> _“Unit Testing Principles, Practices, and Patterns” by Vladimir Khorikov_

Key principles:
- Test **behavior**, not implementation
- Test **public API**, not private details
- Keep tests isolated, fast, and deterministic
- Each unit test must follow a clear 3-step structure:

    Preparation – create mocks, inputs, and initial state

    Action – execute the method or widget under test

    Assertion – verify that the outcome matches expectations

    ✅ Example
    ```dart
    test('adds product to cart', () async {
    // 1. Preparation
    final product = Product(id: 1, name: 'Test', stock: 10);

    // 2. Action
    await service.addToCart(product);

    // 3. Assertion
    expect(repository.savedProducts, contains(product));
    });
    ```

## 🗂️ Project Structure

The test directory **must mirror** the structure of the `lib/` directory:

`lib/ core/ features/ account/`

`test/ core/ features/ account/`

Each feature or module has its corresponding test directory.  

Mocks for individual test files must:
- Be placed in a separate `.mocks.dart` file  
- Use `part`/`part of` syntax  
- Be private to the test

## Necessary packages

Mocks must be implemented with [mocktail](https://pub.dev/packages/mocktail) package.

For BLoC tests use [bloc_test](https://pub.dev/packages/bloc_test)