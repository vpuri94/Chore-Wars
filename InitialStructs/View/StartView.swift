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

extension UIColor {
    static let turquoise = UIColor(red: 0.00, green: 0.57, blue: 0.71, alpha: 1.00)
}
