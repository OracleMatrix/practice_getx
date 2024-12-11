
# Flutter Project with GetX State Management

A feature-rich Flutter application built using the latest technologies, designed for modern use cases like e-commerce, news display, and user management.

---

## 🚀 Key Features

- **Multiple API Integrations**:
  - E-commerce API for product listing, categories, and shopping cart management.
  - News API for fetching and displaying the latest news.
  - User API for handling authentication, registration, and dynamic user profile display.
  - Store API for different products and UI
- **State Management**:
  - Leveraging **GetX** for reactive and efficient state handling.
- **Dependency Injection**:
  - Modularized and scalable dependency management with GetX bindings.
- **Database Management**:
  - Used `get_storage` for offline data persistence.
- **UI/UX Enhancements**:
  - Image caching with `cached_network_image`.
  - Smooth navigation and transitions.
- **Unit Testing**:
  - Test api calls `with "test" package`.

---

## 🛠️ Technologies Used

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [GetX](https://pub.dev/packages/get)
- **Database**: save to local via `get_storage`
- **Networking**: HTTP integration for API communication
- **Image Caching**: `cached_network_image`

---

## ScreenShots

|                               |                               |                               |
|-------------------------------|-------------------------------|-------------------------------|
| ![homePage.jpg](screenshots/homePage.jpg) | ![homePageDarkMode.jpg](screenshots/homePageDarkMode.jpg) | ![newsPage.jpg](screenshots/newsPage.jpg) |
| ![productsDetailsPage.jpg](screenshots/productsDetailsPage.jpg) | ![storePage.jpg](screenshots/storePage.jpg) | ![profilePage.jpg](screenshots/profilePage.jpg) |
| ![loginPage.jpg](screenshots/loginPage.jpg) |
---

## 📂 Project Structure

```
lib/
├── Api/          # API service integrations
├── controllers/       # GetX controllers for state management
├── Models/            # Data models
├── Pages/          # Screens and views

```

---

## 💡 Highlights

- Clean architecture and modular project structure.
- Dynamic data rendering from APIs.
- Efficient state management and dependency handling.

---

## 📦 Packages

Here are the main packages used in this project, as found in the provided configuration file:

- **GetX**
- **cached_network_image**
- **get_storage**
- **google_fonts**

For the complete list of packages, check the `pubspec.lock` or the project configuration file.

---

## 📖 Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd <project-name>
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## 📜 License

This project is licensed under the MIT License.

---

## 🤝 Contribution

Contributions are welcome! Please fork this repository and submit a pull request with your improvements.

---

## 📧 Contact

For any queries or further information, contact:
- **Email**: ehsanmohamadipoor@gmail.com
- **GitHub**: [Your GitHub Profile](https://github.com/oraclematrix)

---
