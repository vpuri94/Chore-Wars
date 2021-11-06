//
//  ScoreCardView.swift
//  dashboard
//
//  Created by Sihan Wu on 11/5/21.
//

import SwiftUI

struct ScoreCardView: View {
    let width = UIScreen.main.bounds.width
    var body: some View {
        let image = Image("profile")
        VStack (alignment: .leading) {
            Text("Your Points")
                .fontWeight(.bold)
                .foregroundColor(.gray)
            HStack {
                image
                .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                    .frame(width: width*0.3, height: width*0.3, alignment: .center)
                        .padding()
                VStack (alignment: .leading) {
                    Text("Andrew123")
                        .fontWeight(.bold)
                    Text("800pts")
                        .fontWeight(.light)
                }
            }
        }
        .padding()
    }
}

struct ScoreCardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreCardView()
    }
}
