//
//  HeaderView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 04/06/2023.
//

import SwiftUI

struct HeaderView: View {

    let title: String
    let subtitle: String
    let background: Color
    let sidesRatio: CGFloat
    let curveRatio: CGFloat = 0.9

    var body: some View {
        ZStack {
            HeaderShape(sidesRatio: sidesRatio, curveRatio: curveRatio)
                .fill(background)
                .shadow(
                    color: .gray.opacity(0.5),
                    radius: 6, x: 1, y: 1
                )
            VStack (alignment: .center) {
                Text(title)
                    .font(.system(size: 44))
                    .foregroundColor(Color.white)
                    .bold()
                    .minimumScaleFactor(0.5)
                    .padding(.horizontal, 10)
                    .lineLimit(1)
                    .opacity(0.9)
                Text(subtitle)
                    .font(.system(size: 26))
                    .foregroundColor(Color.white)
                    .bold()
                    .padding(.horizontal, 10)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .opacity(0.8)
            }
        }
        .frame(
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height / 3
        )
        .shadow(
            color: .gray.opacity(0.5),
            radius: 6, x: 1, y: 1
        )
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        HeaderView(
            title: "Header Title",
            subtitle: "A Long Subtitle Goes Here",
            background: .blue,
            sidesRatio: 10 / 7
        )
    }
    
}
