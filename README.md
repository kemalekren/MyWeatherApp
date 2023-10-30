<!-- ABOUT THE PROJECT -->
## My Weather App

| ScreenShot 1|ScreenShot 2|ScreenShot 3|
|----------|:-------------:|:------:|
| <img src="https://github.com/kemalekren/MyWeatherApp/assets/7187826/b6481c32-e9db-43b1-bd56-6d9ac587302d" width=200 /> | <img src="https://github.com/kemalekren/MyWeatherApp/assets/7187826/6c8b6cb2-7a47-4a7e-910f-7958969e8cb5" width=200 /> | <img src="https://github.com/kemalekren/MyWeatherApp/assets/7187826/4c962bf2-4592-408a-b421-661b4df5275f" width=200 />|


My Weather App is a powerful and user-friendly weather application designed for iOS 16 and above. With a range of features, including search functionality, dark and light modes, real-time weather data updates according to the user's location, and a robust MVVM-C (Model-View-ViewModel-Coordinator) design pattern with dependency injection, My Weather App ensures an exceptional user experience. This README provides an overview of the app, its features, dependencies, and setup instructions.


### Key Features

This section should list any major frameworks/libraries used to bootstrap your project. Leave any add-ons/plugins for the acknowledgments section. Here are a few examples.

* **Search Functionality**: Easily search for weather information in any location around the world.
* **Dark and Light Mode**: Switch between dark and light mode to suit your preferences and reduce eye strain in low-light conditions.
* **Location-Based Forecast**: Get up-to-date weather forecasts for your current location and any custom location, ensuring you're always prepared for the day ahead.
* **MVVM-C Design Pattern**: The app's architecture follows the MVVM-C design pattern, separating concerns and enhancing code maintainability.
* **Dependency Injection**: We've implemented dependency injection to make the app more flexible and testable, ensuring smoother development and updates.
* **Testing-First Approach**: All view models, managers, and components are designed with testing in mind to ensure the app's reliability and stability.
* **Snapshot Testing**: Snapshot tests are included to capture the app's UI in different states, helping maintain a consistent and appealing user interface.
* **Multiple Build Targets**: Weatherly offers three build targets - Development, Staging, and Production - making it easy to manage different deployment environments.


### Dependencies

* **Kingfisher**: For efficient image downloading and caching.
* **SwiftGen**: For generating type-safe Swift code for your assets and resources.
* **Swinject**: For DI Management
* **NGNetworkModule**: A networking module for handling network requests efficiently.
* **Snapshottesting**: Used for capturing and verifying view snapshots in tests.
* **OpenWeatherMap** API: For fetching current weather data and geocoding services for custom location search.
<!-- GETTING STARTED -->
## Getting Started

1. Clone the repository to your local machine:
2. Clone the repo
   ```sh
   git clone https://github.com/your_username_/Project-Name.git](https://github.com/kemalekren/MyWeatherApp.git
   ```
3. Open the Xcode project and select your desired build target (Development, Staging, or Production).
4. Build and run the app on your iOS 16+ device or simulator.

### Design Decisions and Trade-offs
My Weather App is built on a foundation of design decisions that prioritize scalability, testability, and extensibility while adhering to SOLID principles. This section provides insight into some of the choices made during development, as well as the considerations and trade-offs involved in building this iOS app.

Legacy Router Mechanism
The decision to utilize the Legacy Router Mechanism ( UI Kit Based) instead of NavigationStack or NavigationView was driven by a desire to harness the powerful features of Legacy Router. I acknowledge that NavigationStack and NavigationView are evolving components of SwiftUI, and I believe they have potential. However, I opted for the Legacy Router to leverage its capabilities fully and provide a seamless user experience.

Architectural Patterns
My Weather App adopts a structured approach to its architecture, employing Builders, Containers, Coordinators, Managers, and View Models. All of these components are designed with protocols to ensure testability. This adherence to protocol-based design enhances the app's maintainability and flexibility.

API Key Security
The project requires a hardcoded API key because of the OpenWeatherMap preferences, which can present vulnerabilities. I acknowledge the security concerns this raises and have taken steps to mitigate them. While the API key is stored within the app, I strongly recommend that sensitive data like API keys be fetched from a secure server during runtime and stored in the iOS Keychain. This approach significantly enhances security by preventing unauthorized access to the API key.

Reusable SwiftUI Views
My Weather App's user interface is entirely built in SwiftUI with UIHostingViewController, emphasizing reusability and consistency. SwiftUI's declarative nature allows us to create dynamic and adaptable views, providing a more interactive and engaging experience for users.

Conclusion
Building My Weather App was a deliberate endeavor, aimed at creating an iOS app that stands up to real-life conditions. My design decisions reflect my commitment to delivering a scalable, testable, and extensible product while prioritizing user security and experience.

<!-- LICENSE -->
## License

Distributed under the MIT License.
