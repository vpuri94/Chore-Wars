//
//  ChoreRow.swift
//  dashboard
//
//  Created by Sihan Wu on 11/5/21.
//

import SwiftUI

struct ChoreRow: View {
    @State private var checked = true
    var body: some View {
        HStack (alignment:.center) {
            VStack (alignment:.leading){
                Text("Sweeping Leaves")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("Due Mon, 10/4 at 2:00pm")
            }.padding()
            Spacer()
            CheckBoxView(checked: $checked)
                .padding()
            Spacer()
        }
    }
}

struct ChoreRow_Previews: PreviewProvider {
    static var previews: some View {
        ChoreRow()
    }
}
