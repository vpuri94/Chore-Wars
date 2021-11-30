//
//  SignUpView2.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 11/28/21.
//

import SwiftUI
import Firebase

struct SignUpView2: View {
    @State private var displayName = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var avatar = ""
    @State private var userId = Auth.auth().currentUser?.uid
    
    var body: some View {
        let width  = UIScreen.main.bounds.width
        
        
        VStack{
            Spacer()
            Text("Upload Picture").font(.subheadline)
            Image(systemName: "person.circle").resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .padding()
            TextField(
                "DisplayName",
                text: $displayName
            ).frame(width: width-50, height: 50)
                .font(.custom("Montserrat",size: 18))
                .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.top)
            TextField(
                "First Name",
                text: $firstName
            ).frame(width: width-50, height: 50)
                .font(.custom("Montserrat",size: 18))
                .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.top)
            TextField(
                "LastName",
                text: $lastName
            ).frame(width: width-50, height: 50)
                .font(.custom("Montserrat",size: 18))
                .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.top)
            Button( action:{
                let cat  = "String"
            },label:{
                Text("Sign Up")
                    .frame(width:width-100)
                    .padding()
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            })
                .background(Color.signIn)
                .cornerRadius(10)
        }
        Spacer()
    }
}

struct SignUpView2_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView2()
    }
}
