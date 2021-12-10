//
//  TaskView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 10/20/21.
//

import Foundation
import SwiftUI
import Firebase

struct LeaderboardView: View {
    var db = Firestore.firestore()
    @State private var selection: String? = "A"
    @ObservedObject  var user: UserViewModel
    @Binding var tabSelection: Int
    var width  = UIScreen.main.bounds.width
    let image = Image("profile")
    let prize = Image("prize")
    let punishment = Image("punishment")
//    @State var currentReward = AuthViewModel.currentTeam?.currentReward
//    @State var currentPunishment = AuthViewModel.currentTeam?.currentPunishment

    var body: some View {
           NavigationView {
               VStack(alignment: .leading){
                   HStack{
                       Spacer()
                       Text("Round 1")
                           .frame( alignment: .center).foregroundColor(Color.gray)
                           .padding()
                       Spacer()
                   }
                   VStack(alignment: .leading){
                       HStack{
                           prize.resizable()
                               .frame(width: 42,height: 42)
                               .clipShape(Circle())
                               .padding(.horizontal)
                           VStack(alignment: .leading, spacing: 5){
                               Text("Prize")
                                   .font(.system(size: 18))
                                   .foregroundColor(Color.gray)
                               Text(user.currentReward)
                                   .font(.system(size: 14))
                                    .font(Font.body.bold())
                                    .lineLimit(nil)
                           }
                           Spacer()
                           
                       }.frame(width: width-50, height: 65)
                       .padding()
                           .background(Color.white)
                           .cornerRadius(10)
                           .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0,y:1)
                       HStack{
                           punishment.resizable()
                               .frame(width: 42,height: 42)
                               .clipShape(Circle()).padding(.horizontal)
                           VStack(alignment: .leading, spacing: 5){
                               Text("Punishment")
                                   .font(.system(size: 18))
                                   .foregroundColor(Color.gray)
                               Text(AuthViewModel.currentTeam?.currentPunishment ?? "No Data found")
                                   .font(.system(size: 14))
                                   .lineLimit(nil)
                           }
                           Spacer()
                           Spacer()
                           
                       }.frame(width: width-50, height: 65)
                       .padding()
                           .background(Color.white)
                           .cornerRadius(10)
                           .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0,y:1)
                       
                       
                   }.padding()
                   ScrollView{
                       Ranking(user: user).padding(.horizontal)
                   }
                   Spacer()
               }
               
               .navigationBarTitle("Leaderboard").font(.custom("Montserrat", size: 20))
               .navigationBarTitleDisplayMode(.inline)
               .onAppear(){
                   self.user.getTeamFromUser()
                   self.user.fetchData()
              }
               .background(Color.lighterGray)
           }
        }
//
//    func rewardPunishment(){
//        print("inside")
//        db.collection("team").whereField("code", isEqualTo:user.currentUserTeam)
//            .getDocuments() { (querySnapshot, err) in
//                print("another inside")
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    print("hello")
//                    print(user.currentUserTeam)
//                    querySnapshot.
//                    for document in querySnapshot!.documents {
////                        print("\(document.documentID) => \(document.data())")
//                        AuthViewModel.currentReward  = document["currentReward"] as? String ?? "No data found"
//                        AuthViewModel.currentPunishment  = document["currentPunishment"] as? String ?? "No data found"
//                        print("here inside")
//                        print(AuthViewModel.currentReward)
//                        print(AuthViewModel.currentPunishment)
//                    }
//                }
//            }
//        }
    }


struct Ranking: View{
    @State var rank = 1
    @State var previous = 0
    let image = Image("profile")
    @ObservedObject  var user: UserViewModel
    
    var body: some View{
//        print( dict)
        let width  = UIScreen.main.bounds.width
        VStack (alignment: .leading){
            Text("Ranking")
        }.frame(width: width-50, alignment: .leading)
        ForEach(self.user.users.sorted(by: {$0.totalPoints > $1.totalPoints}),id: \.id) { eachUser in
            if(eachUser.team == user.currentUserTeam){
                if(eachUser.email != user.currentUserEmail){
                HStack{
                    Text(String("#\(rank)")).font(Font.body.bold()).padding(.horizontal)
                    image.resizable()
                        .frame(width: 42, height: 42)
                                .clipShape(Circle())
                                .padding(.horizontal)
                        VStack(alignment: .leading, spacing: 5){
                            Text(eachUser.displayName)
                                .font(Font.body.bold())
                                .font(.system(size: 20))
                                .foregroundColor(Color.black)
                            Text(String(eachUser.totalPoints))
//                            Text(String(eachUser.team))
                        }
                        Spacer()
                    
                }
                .frame(width: width-50, height: 100)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0,y:1)
                } else {
                HStack{
                    Text(String("#\(rank)")).font(Font.body.bold()).padding(.horizontal)
                    image.resizable()
                        .frame(width: 42, height: 42)
                                .clipShape(Circle())
                                .padding(.horizontal)
                        VStack(alignment: .leading, spacing: 5){
                            Text(eachUser.displayName)
                                .font(Font.body.bold())
                                .font(.system(size: 20))
                                .foregroundColor(Color.black)
                            Text(String(eachUser.totalPoints))
                        }
                        Spacer()
                    
                    }.frame(width: width-50, height: 100)
                    .padding()
                    .background(Color(red: 63/255, green: 143/255, blue: 176/255))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0,y:1)
                }
            }
        }.background(Color.lighterGray)
    }
    
}
