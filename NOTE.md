### **Dependency Injection Design Pattern in Dart**

## Overview

This project demonstrates the use of the **Dependency Injection** design pattern in Dart. The purpose of Dependency Injection is to manage the dependencies of a class by providing them externally, instead of creating them within the class. This promotes loose coupling and makes the code easier to test, maintain, and extend.

In this example, we will explore how Dependency Injection works in Dart by simulating a small application that fetches data from either an API service or a database service.

## Key Concepts

- **Dependency Injection (DI)**: A software design pattern where an object’s dependencies are provided externally, rather than being created inside the object.
- **Loose Coupling**: DI helps reduce dependencies between classes, making the code easier to modify and extend.
- **Testability**: DI makes it easier to test your classes by allowing you to inject mock dependencies.

## Example of Dependency Injection in Dart
```dart
//abstraction(interface)
abstract class ApiClient {
  Future<void> fetchData();
}
//implement ApiClient - http
class HttpApiClient implements ApiClient {
  @override
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    print('Data (HTTP): ${response.body}');
  }
}
//implement ApiClient - Dio
class DioApiClient implements ApiClient {
  final Dio _dio = Dio();

  @override
  Future<void> fetchData() async {
    final response = await _dio.get('https://api.example.com/data');
    print('Data (Dio): ${response.data}');
  }
}
//Inject Dependency
class ApiService {
  final ApiClient apiClient;

  ApiService(this.apiClient);

  Future<void> fetchData() async {
    await apiClient.fetchData();
  }
}

void main() {
  // Chọn client (có thể là HttpApiClient hoặc DioApiClient)
  final ApiClient apiClient = DioApiClient(); // Hoặc HttpApiClient();
  final ApiService apiService = ApiService(apiClient);
  apiService.fetchData();
}

```
### **Notes on Loose Coupling**

#### **1. Definition**
- **Loose Coupling** is a software design principle aimed at reducing dependencies between components in a system.
- A loosely coupled component does not know or care about how another component performs its functions, interacting only through abstraction.

---

#### **2. Benefits of Loose Coupling**
1. **Easier Replacement:**  
   - Modify or update one component without needing to change the rest of the system.
2. **Reusability:**  
   - Components can be reused in other projects without being tied to a specific environment.
3. **Testing Support:**  
   - Easily mock or replace components for unit testing.
4. **Improved Maintainability:**  
   - When the system evolves or scales, changes have minimal impact on other components.

---

#### **3. Examples of Loose Coupling**
In a Flutter project, you can achieve **Loose Coupling** by:
- **Abstraction:** Using interfaces or abstract classes to define common functionality.
- **Dependency Injection (DI):** Injecting dependencies into classes instead of creating them directly.
- **Service Locator:** Managing dependencies in a centralized manner.

##### **Specific Example**
For an API Client (`HttpApiClient` or `DioApiClient`), you can use abstraction to reduce dependency:

```dart
abstract class ApiClient {
  Future<void> fetchData();
}

class HttpApiClient implements ApiClient {
  // Implement ApiClient using http
}

class DioApiClient implements ApiClient {
  // Implement ApiClient using dio
}
```

In a class using the API Client, inject only the interface:

```dart
class ApiService {
  final ApiClient apiClient;

  ApiService(this.apiClient);

  Future<void> fetchData() async {
    await apiClient.fetchData();
  }
}
```

To switch from `HttpApiClient` to `DioApiClient`, simply provide a different implementation without altering `ApiService`.

---

#### **4. Conclusion**
- **Loose Coupling** helps build flexible, maintainable, and scalable applications.
- In Flutter, architectures like **BLoC**, **Provider**, or **GetIt** promote **Loose Coupling** to create well-structured and easy-to-develop applications.

#### **5. Further Reading**
- **Dependency Injection:** [Flutter Documentation](https://docs.flutter.dev/cookbook/dependency-injection)  

### ***5. Layout**
## 1. Wrap content with `SingleChildScrollView`

Use `SingleChildScrollView` to enable scrolling when the content exceeds the screen size.

```dart
SingleChildScrollView(
  child: Column(
    children: <Widget>[ /* child widgets */ ],
  ),
)
```

## 2. Adjust widget size with `Flexible`, `Expanded`, `LayoutBuilder`

- **`Flexible`**: Adjust the widget's proportion within `Row`, `Column`, or `Flex`.

```dart
Flexible(flex: 1, child: Container());
```

- **`Expanded`**: Automatically takes up the remaining space.

```dart
Expanded(child: Container());
```

- **`LayoutBuilder`**: Change the layout based on available space.

```dart
LayoutBuilder(
  builder: (context, constraints) => Container(width: constraints.maxWidth),
);
```

## 3. Use `FractionallySizedBox` to adjust the size ratio

`FractionallySizedBox` allows resizing the widget based on a percentage of the available space.

```dart
FractionallySizedBox(
  widthFactor: 0.5, heightFactor: 0.5,
  child: Container(),
);
```
