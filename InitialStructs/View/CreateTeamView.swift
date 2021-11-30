//
//  CreateTeamView.swift
//  InitialStructs
//
//  Created by M.Talha  Subzwari on 11/29/21.
//

import SwiftUI

struct CreateTeamView: View {
    
    var body: some View {
        let width  = UIScreen.main.bounds.width
        Button( action:{
            let cat  = "String"
        },label:{
            Text("Create a Team")
                .frame(width:width-100)
                .padding()
                .foregroundColor(Color.white)
                .cornerRadius(10)
        })
            .onTapGesture {
                
            }
            .background(Color.CreateTeamColor)
            .cornerRadius(10)
        CenterDivider()
        
    }
}

struct CreateTeamView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTeamView()
    }
}
