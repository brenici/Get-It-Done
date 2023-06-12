 # Get It Done

`SwiftUI` `iOS` `FirebaseFirestore` `FirebaseAuth`

The Get It Done is a task manager for iOS app developed using SwiftUI. It provides a user-friendly interface for managing tasks and incorporates user authentication with FirebaseAuth and data storage using FirebaseFirestore.

![GetItDone_preview](https://github.com/brenici/Get-It-Done/assets/18484454/cb1b7b32-b746-4925-a288-c0ff25dbb5e0)

The app is built using the MVVM (Model-View-ViewModel) pattern.

## Features

- User authentication: Users can create an account, log in, and log out to access their personalized task manager.
- Task management: Users can create and delete tasks and update their completion status. Each task includes a title, due time, and completion status.
- Task sorting: Users can sort the tasks based on their completion status, creation time, due time and by title.
- Customizable title header view with a trapezoid shape and an adjustable curved bottom side.
- Customizable Navigation Bar based on current view.
- Animated form input validation error message.

## Installation

To run the Get It Done app on your local machine, follow these steps:

1. Clone the repository to your local machine using the following command:

   ```shell
   git clone https://github.com/brenici/Get-It-Done.git
   ```

2. Open the project in Xcode by double-clicking on the `.xcodeproj` file.

3. Install the required dependencies using CocoaPods. Navigate to the project directory in the terminal and run the following commands:

   ```shell
   pod repo update
   pod install
   ```
You can choose among different [Firebase Instalation Methods](https://firebase.google.com/docs/ios/installation-methods).

4. Set up the Firebase project:
   - Create a new Firebase project on the [Firebase Console](https://console.firebase.google.com/).
   - Enable **Firebase Authentication** and choose the Email/Password authentication method.
   - Enable **Cloud Firestore** as the database.
   - Download the `GoogleService-Info.plist` file from the Firebase project settings.
   - Place the downloaded `GoogleService-Info.plist` in the Xcode project.

5. Build and run the app in the Xcode simulator or on a physical iOS device.

Note: If you encounter any issues related to dependencies or building the project, make sure you have the latest version of Xcode installed on your machine. 

## Compatibility

- Supports: iOS 15 and higher
- Devices: iPhone
- Orientation: Portrait

## Dependencies

The Get It Done app relies on the following dependencies:

- **FirebaseAuth**: Provides user authentication with FirebaseAuth.
- **FirebaseFirestore**: Enables data storage and real-time updates using FirebaseFirestore.
- **FirebaseFirestoreSwift**: Simplifies the process of integrating Firestore into Swift applications.

## Contributing

Contributions to the Get It Done app are welcome! If you find any bugs, have feature requests, or would like to contribute enhancements, please open an issue or submit a pull request.

## License

The Get It Done app is released under the [MIT License](LICENSE).
