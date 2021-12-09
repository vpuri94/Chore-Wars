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
                Image("logo")
                    .scaledToFit()
                    .frame(width:200, height:200, alignment:.center)
                Text("Chore Wars")
                    .frame(width: width, alignment: .center)
                    .font(.custom("Montserrat-Bold",size: 40))
                    .foregroundColor(Color(UIColor.turquoise))
                Spacer()
                NavigationLink(destination: LogInView(user: user)) {
                    Text("Log In")
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

extension UIColor {
    static let turquoise = UIColor(red: 0.00, green: 0.57, blue: 0.71, alpha: 1.00)
}
