//
//  SignUp.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 11/28/21.
//

import SwiftUI
import Firebase

struct SignUp: View {
    
    var body: some View {
        VStack{
            Spacer()
            GoogleAndFacebook()
            CenterDivider()
            EmailAndPassword()
            Spacer()
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

struct EmailAndPassword: View{
    @State private var email = ""
    @State private var password = ""
    @State private var rePassword = ""
    @State var err = "Error"
    @State var shown = false
    @State var message = ""
    
    var body: some View{
        let width  = UIScreen.main.bounds.width
        
        VStack{
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
                    .padding()
            SecureField(
                    "Re enter Password",
                    text: $rePassword
                    
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
                    self.message = "fill the content"
                    self.shown.toggle()
                    return
                }
                if(self.password != self.rePassword){
                    self.message = "Password dont match"
                    self.shown.toggle()
                    return
                }
                Auth.auth().createUser(withEmail:email , password: password){ (res, err) in
                    if (err != nil){
                        print(err!.localizedDescription )
                        self.message = err!.localizedDescription
                        self.shown.toggle()
                        return
                    }
                    self.message = "Success"
                    self.shown.toggle()
//                    user.signedIn.toggle()
                    print(Auth.auth().currentUser?.uid)
                }
            },label:{
                Text("Sign Up")
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
            return Alert(title: Text(self.message))
            
        }
            
            
        }
    }
