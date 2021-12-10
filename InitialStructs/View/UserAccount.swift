//
//  UserAccount.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 12/9/21.
//

import SwiftUI

struct UserAccount: View {
    @ObservedObject var user: UserViewModel
    @State var newDisplayName = ""
    @State var teamCode = ""
    
    var body: some View {
        let image = Image("profile")
        let width  = UIScreen.main.bounds.width
        VStack{
            Spacer()
            Text("Update User Profile").font(.title)
            
            image.resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Text("Display Name").frame(width: width-50, alignment: .leading)
            HStack{
            TextField(
                "Display Name: \(user.currentUser?.displayName ?? "")",
                text: $newDisplayName
            ).frame(width: width*0.5)
                .font(.custom("Montserrat",size: 18))
                .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    
                Button( action:{
                    if(newDisplayName != ""){
                        user.updateDisplayName(displayName: newDisplayName)
                    }
                },label:{
                    Text("Update Name")
                        .frame(width:width*0.25)
                        .padding()
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                })
                    .background(Color.signIn)
                    .cornerRadius(10)
            }
            HStack{
                TextField(
                    "Team Code : \(user.currentUserTeam)",
                    text: $teamCode
                ).frame(width: width*0.5, height: 50)
                    .font(.custom("Montserrat",size: 18))
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.black, lineWidth: 1)
                        )
                Button( action:{
                    if(teamCode != ""){
                        user.updateTeam(teamCode: teamCode)
                    }
                },label:{
                    Text("Update Team")
                        .frame(width:width*0.25)
                        .padding()
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                })
                    .background(Color.signIn)
                    .cornerRadius(10)
            }.padding()
            Spacer()
        }
    }
}


//struct UserAccount_Previews: PreviewProvider {
////    @ObservedObject var user: UserViewModel
//    static var previews: some View {
//        UserAccount()
//    }
//}
