## KeychainSwiftDemo

This project demonstrates how to securely store user credentials (such as passwords) using the **KeychainSwift** library.

### Features:
- Store, retrieve, and delete passwords securely in the iOS Keychain.
- **KeyManager Singleton**: Centralized key management using a singleton pattern for better reusability and maintainability.

### Setup:
1. Install **KeychainSwift** by adding it to your project using **Swift Package Manager**:
   - URL: [https://github.com/evgenyneu/keychain-swift](https://github.com/evgenyneu/keychain-swift)

2. The project uses `KeyManager`, a singleton that handles all Keychain operations. You can access the `KeyManager` instance like this:

```swift
KeyManager.shared.savePassword("your_password")
let password = KeyManager.shared.getPassword()
KeyManager.shared.deletePassword()
```

### Credits:
This project uses the open-source library **KeychainSwift** created by [Evgenii Neumerzhitckii](https://github.com/evgenyneu/keychain-swift). Full documentation and more information about this library can be found [here](https://github.com/evgenyneu/keychain-swift).
