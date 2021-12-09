//
//  StartView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 12/1/21.
//

import SwiftUI

struct StartView: View {
    @ObservedObject  var user: UserViewModel
    
    var body: some View {
        let width  = UIScreen.main.bounds.width
        let image = Image("app")
        NavigationView{
            VStack(spacing: 30){
                Spacer().frame( height: 100, alignment: .leading)
//                VStack{
//                Text("Welcome To ")
//                Text("Chore Wars").font(.title)
//                    .font(.custom("Montserrat",size: 40))
//                    .frame(width: width, alignment: .center)
//                    .foregroundColor(Color.blue)
//                }
                image.resizable()
                    .frame(width: 150, height: 150)
                Spacer()
                NavigationLink(destination: LogInView(user: user)) {
                    Text("LogIn")
                        .foregroundColor(Color.white)
                        .frame(width: width-100, height: 50)
                        
                            .font(.custom("Montserrat",size: 20))
                            .padding(4)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .padding(.bottom)
                    
                }
                NavigationLink(destination: SignUp(user:user)) {
                    Text("Sign Up")
                        .foregroundColor(Color.white)
                        .frame(width: width-100, height: 50)
                            .font(.custom("Montserrat",size: 20))
                            .padding(4)
                                .background(Color.signIn)
                                .cornerRadius(10)
                                .padding(.bottom)
                    
                }
                    .navigationBarHidden(true)
                Spacer(minLength: 10)
            }
            
        }.background(Color.lighterGray)
        
    }
}
