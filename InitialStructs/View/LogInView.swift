//
//  LogInView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 11/23/21.
//

import SwiftUI
import Firebase

struct LogInView: View {
    @ObservedObject  var user: UserViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var err = "Error"
    @State var shown = false
    @State var msg = ""
    
    var body: some View {
        
        
        let width  = UIScreen.main.bounds.width
        
        
        
        NavigationView{
            VStack(spacing: 20){
                Spacer()
            
                // MARK: Google and Facebook Log in
                GoogleAndFacebook()
                CenterDivider()
                
                // MARK: custom Log in
                VStack(alignment: .center){
                    TextField(
                        "Enter your Email",
                        text: $email
                    ).frame(width: width-50, height: 50)
                        .font(.custom("Montserrat",size: 18))
                        .padding(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 7)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .padding(.top)
                        
                    SecureField(
                            "Password",
                            text: $password
                            
                    ).frame(width: width-50, height: 50)
                        .font(.custom("Montserrat",size: 18))
                        .padding(4)
                            .background(
                                RoundedRectangle(cornerRadius: 7)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .padding(.bottom)
                    
                    Button( action:{
                        if (self.email == "" &&  self.password == ""){
                            self.msg = "fill the content"
                            self.shown.toggle()
                            return
                        }
                        Auth.auth().signIn(withEmail:email , password: password){ (res, err) in
                            if (err != nil){
                                print(err!.localizedDescription )
                                self.msg = err!.localizedDescription
                                self.shown.toggle()
                                return
                            }
                            user.getUserFromEmail(email: email)
                            self.msg = "Success"
                            self.shown.toggle()
                            user.signedIn.toggle()
                           
//                            print(Auth.auth().currentUser?.uid)
                        }
                    },label:{
                        Text("Sign In")
                            .frame(width:width-100)
                            .padding()
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                        .background(Color.signIn)
                        .cornerRadius(10)

                }.autocapitalization(.none)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
            
                .alert(isPresented: $shown){
                    return Alert(title: Text(self.msg))
                    
                }
                HStack{
                    Text(String(user.signedIn))
                }
                Spacer()
                Divider()
                Spacer()
                    
            }.navigationBarTitle("LogIn", displayMode: .inline)
    }
    }
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(.darkPink)
            .padding(10)
    }
}
extension Color {
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
    static let facebookColor = Color(red: 51.0/255, green: 121/255, blue: 195/255)
    static let googleColor = Color(red: 240/255, green: 100/255, blue: 50/255)
    static let signIn = Color(red: 21/255, green: 57/255, blue: 80/255) // Darker than Facebook
    static let CreateTeamColor = Color(red: 243/255, green: 184/255, blue: 82/255) // Darker than Facebook
    
}

struct GoogleAndFacebook: View{
    
//    let width  = UIScreen.main.bounds.width
    var body: some View{
        var cat = "";
        let width  = UIScreen.main.bounds.width
        VStack(alignment: .leading){
            Button(
                action:{
                cat = "String"
            },label:{
                Text("Connect With Facebook")
                    .frame(width:width-100)
                    .padding()
                    .foregroundColor(.white)
            }).background(Color.facebookColor)
                .cornerRadius(10)
                .disabled(true)
            Button( action:{
                cat = "String"
            },label:{
                Text("Connect with Google")
                    .frame(width:width-100)
                    .padding()
                    .foregroundColor(.white)
            }).background(Color.googleColor)
                .cornerRadius(10)
                .disabled(true)
        }
        
    }
}

struct CenterDivider: View{
    var body: some View{
        HStack{
            VStack { Divider().padding(4)}
            Text("Or")
            VStack { Divider().padding(4)}
        }
        
    }
}
