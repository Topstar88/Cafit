//
//  CFAStep2.swift
//  Cafit
//
//  Created by Topstar88 on 12/5/21.
//

import SwiftUI

struct CFAStep2: View {
    @State private var selectedLevel: Int = 0
    var body: some View {
        VStack {
            Text("Select your fitness level")
                .font(.quicksand(.bold, size: 24))
                .foregroundColor(Color.darkColor)
                .padding([.bottom], 35)
            ForEach(0...2, id: \.self) { index in
                Group {
                    Spacer()
                        .frame(maxHeight: 25)
                    Text(index == 0 ? "Beginer" : (index == 1 ? "Intermediate" : "Advanced"))
                        .font(.quicksand(.bold, size: 20))
                        .foregroundColor(
                            Color(red: 110/255, green: 110/255, blue: 110/255, opacity: 1)
                        )
                    Spacer()
                        .frame(maxHeight: 15)
                    ZStack(alignment: .leading) {
                        Text(index == 0 ? "You are new to fitness training" : (index == 1 ? "You have been training regularly" : "You're fit and ready for an intensive\nworkout plan"))
                            .font(.quicksand(.regular, size: 18))
                            .foregroundColor(selectedLevel == index ? Color.primaryColor : Color.darkColor)
                            .padding([.leading], 5)
                        if selectedLevel == index {
                            Group {
                                Image("ic_check")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 21, height: 16)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding([.leading, .trailing], 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onTapGesture {
                    self.selectedLevel = index
                }
                
                Spacer()
                    .frame(maxHeight: 35)
                    
                if index != 2 {
                    Rectangle()
                        .fill(Color.lightGrayColor)
                        .frame(maxWidth: .infinity, maxHeight: 1)
                        .padding([.leading, .trailing], 28)
                }
                
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .offset(x: 0, y: 150)
        .ignoresSafeArea()
    }
}

struct CFAStep2_Previews: PreviewProvider {
    static var previews: some View {
        CFAStep2()
    }
}
