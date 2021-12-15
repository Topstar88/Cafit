//
//  ExerciseView.swift
//  Cafit
//
//  Created by Topstar88 on 12/6/21.
//

import SwiftUI

struct ExerciseView: View {
    var index: Int
    var backgroundColor, borderColor: Color
    var title, minutes: String
    
    init(index: Int, color: Color, borderColor: Color, title: String, mins: String) {
        self.index = index
        self.backgroundColor = color
        self.title = title
        self.minutes = mins
        self.borderColor = borderColor
    }
    
    var body: some View {
        HStack {
            ZStack(alignment: .center) {
                if index == 2 {
                    Image("ic_star")
                } else {
                    Text("\(index + 1)")
                        .font(.quicksand(.bold, size: 18))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 26, height: 26)
                }
            }
            .frame(width: 26, height: 26)
            .background(backgroundColor)
            .cornerRadius(13)
            .overlay(Circle().stroke(borderColor, lineWidth: 4))
            
            Spacer()
                .frame(width: 15)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.quicksand(.bold, size: 18))
                    .foregroundColor(backgroundColor)
                    .cornerRadius(13)
                Text(minutes)
                    .font(.quicksand(.bold, size: 14))
                    .foregroundColor(Color(hex: 0x949397))
                    .cornerRadius(13)
            }
            
            Spacer()
            Image("ic_inform")
                .frame(width: 24, height: 24)
        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing], 20)
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(index: 0, color: .darkColor, borderColor: .yellow, title: "Title", mins: "Mins")
    }
}
