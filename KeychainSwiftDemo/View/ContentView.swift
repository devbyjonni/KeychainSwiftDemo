//
//  ContentView.swift
//  KeychainSwiftDemo
//
//  Created by Jonni Akesson on 2024-09-06.
//

import SwiftUI

struct ContentView: View {
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
                    savePassword(newPassword)
                }, label: {
                    Text("Save Password")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                
                Button(action: {
                    getPassword()
                }, label: {
                    Text("Get Password")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                
                Button(action: {
                    deletePassword()
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
            getPassword() // Automatically fetch the password on appear
        }
    }
    
    // Function to delete the password using KeyManager
    private func deletePassword() {
        KeyManager.shared.deletePassword()
        password = ""
        errorMessage = "Password has been deleted."
    }
    
    // Function to retrieve the password using KeyManager
    private func getPassword() {
        if let retrievedPassword = KeyManager.shared.getPassword() {
            password = retrievedPassword
            errorMessage = nil
        } else {
            errorMessage = "Failed to retrieve password or no password set."
        }
    }
    
    // Function to save the password using KeyManager
    private func savePassword(_ value: String) {
        KeyManager.shared.savePassword(value)
        getPassword() // Refresh UI after saving
    }
}

#Preview {
    ContentView()
}
