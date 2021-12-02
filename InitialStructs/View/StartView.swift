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
        
        NavigationView{
            VStack(spacing: 30){
                Spacer().frame( height: 100, alignment: .leading)
                Text("Welcome To ChoreWars")
                    .font(.custom("Montserrat",size: 40))
                    .frame(width: width, alignment: .center)
                    .foregroundColor(Color.blue)
                Spacer()
                NavigationLink(destination: LogInView(user: user)) {
                    Text("LogIn")
                        .foregroundColor(Color.white)
                        .frame(width: width-100, height: 50)
                        
                            .font(.custom("Montserrat",size: 20))
                            .padding(4)
                            
                                .background(
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                                .background(Color.blue)
                                .padding(.bottom)
                    
                }
                NavigationLink(destination: SignUp(user:user)) {
                    Text("Sign Up")
                        .foregroundColor(Color.white)
                        .frame(width: width-100, height: 50)
                            .font(.custom("Montserrat",size: 20))
                            .padding(4)
                                .background(
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                                .background(Color.signIn)
                                .padding(.bottom)
                    
                }
                    .navigationBarHidden(true)
                Spacer(minLength: 10)
            }
        }
        
    }
}
