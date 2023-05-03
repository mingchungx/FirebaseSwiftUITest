//
//  WelcomeView.swift
//  FirebaseTest
//
//  Created by Mingchung Xia on 2023-05-02.
//

import SwiftUI
import Firebase

struct WelcomeView: View {
    @EnvironmentObject var dataManager: DataManager
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var userSignedIn: Bool = false
    
    var body: some View {
        if userSignedIn {
            SignedInView()
                .environmentObject(dataManager)
        } else {
            content
        }
    }
    
    var content: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: -135))
                .offset(y: -300)
                .offset(x: -90)
            
            VStack() {
                Spacer()
                
                HStack {
                    Text("Welcome")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                
                HStack {
                    TextField("Email Address", text: $email)
                        .padding()
                        .background(
                            .thinMaterial,
                            in: RoundedRectangle(cornerRadius: 30)
                        )
                        .padding()
                }
                SecureField("Password", text: $password)
                    .padding()
                    .background(
                        .thinMaterial,
                        in: RoundedRectangle(cornerRadius: 30)
                    )
                    .padding()
                
                Button {
                    firebaseRegister()
                } label: {
                    HStack {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding()
                            .padding(.leading, 30)
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.gray)
                            .padding()
                            .padding(.trailing, 30)
                    }
                    .background(
                        .white,
                        in: RoundedRectangle(cornerRadius: 10)
                        
                    )
                }
                
                Button {
                    firebaseSignIn()
                } label: {
                    Text("Already have an account? Sign In")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.top, 4)
                }
                
                Spacer()
            }
        }
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    userSignedIn.toggle()
                }
            }
        }
    }
    
    func firebaseRegister() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func firebaseSignIn() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(DataManager())
    }
}
