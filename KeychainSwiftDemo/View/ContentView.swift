//
//  ContentView.swift
//  KeychainSwiftDemo
//
//  Created by Jonni Akesson on 2024-09-06.
//

import SwiftUI
import KeychainSwift

//GitHub
//https://github.com/evgenyneu/keychain-swift

struct ContentView: View {
    private let keychainSwift = KeychainSwift()
    private let key = "user_password"
    
    @State private var password = ""
    @State private var newPassword = ""
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(spacing: 20) {
            SecureField("Enter new password", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack(spacing: 10) {
                Button(action: {
                    setKey(newPassword)
                }, label: {
                    Text("Save Password")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                
                Button(action: {
                    getKey()
                }, label: {
                    Text("Get Password")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                
                Button(action: {
                    deleteKey()
                }, label: {
                    Text("Delete Password")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
            }
            
            Text(password.isEmpty ? "No Password Set" : "Current Password: \(password)")
                .padding()
                .fontWeight(password.isEmpty ? .regular : .bold)
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            getKey()
        }
    }
    
    // Function to delete the saved password
    private func deleteKey() {
        keychainSwift.synchronizable = true
        keychainSwift.delete(key)
        password = ""
        errorMessage = "Password has been deleted."
    }
    
    // Function to get the saved password from the keychain
    private func getKey() {
        keychainSwift.synchronizable = true
        if let retrievedPassword = keychainSwift.get(key) {
            password = retrievedPassword
            errorMessage = nil
        } else {
            errorMessage = "Failed to retrieve password or no password set."
        }
    }
    
    // Function to set the new password in the keychain
    private func setKey(_ value: String) {
        keychainSwift.synchronizable = true
        keychainSwift.set(value, forKey: key)
        getKey()
    }
}

#Preview {
    ContentView()
}
