# KeychainSwiftDemo

This project demonstrates how to use the **KeychainSwift** library to securely store, retrieve, and delete passwords using the keychain in a SwiftUI app.

## Features

- Save a password securely in the keychain.
- Retrieve the saved password.
- Delete the password from the keychain.
- Supports Keychain synchronization across devices.

## Getting Started

### Installation

To use the **KeychainSwift** library, you can add it via Swift Package Manager:

1. Open your project in Xcode.
2. Go to **File** > **Swift Packages** > **Add Package Dependency**.
3. Enter the following URL: `https://github.com/evgenyneu/keychain-swift`
4. Choose the latest version and add it to your project.

### Usage

The app provides a simple UI with three buttons:
1. **Save Password**: Saves the entered password to the keychain.
2. **Get Password**: Retrieves and displays the saved password from the keychain.
3. **Delete Password**: Deletes the password from the keychain.

### Requirements

- iOS 14.0+
- Swift 5.0+

### License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

