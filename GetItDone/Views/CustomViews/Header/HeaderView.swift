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
    let height: CGFloat
    let background: Color
    let sidesRatio: CGFloat
    let controlPointRatio: (CGFloat, CGFloat)

    var body: some View {
        ZStack {
            headerShape
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
            height: height
        )
        .shadow(
            color: background.opacity(0.2),
            radius: 6, x: 1, y: 1
        )
    }
    
    @ViewBuilder var headerShape: some View {
        HeaderShape(
            sidesRatio: sidesRatio,
            controlPointRatio: controlPointRatio
        )
            .fill(background)
            .shadow(
                color: .black.opacity(0.3),
                radius: 6, x: 1, y: 1
            )
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        HeaderView(
            title: "Short Title",
            subtitle: "A Long Subtitle Goes Here",
            height: UIScreen.main.bounds.height / 3,
            background: .blue,
            sidesRatio: 10 / 7,
            controlPointRatio: (0.7, 0.2)
        )
    }
    
}
