//
//  WelcomeView.swift
//  Cafit
//
//  Created by Polaris on 12/5/21.
//

import SwiftUI

struct CFAStep1: View {
    var body: some View {
        VStack(alignment: .center, spacing: 24.0) {
            Image("cfa-welcome")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 250)
            
            Text("Welcome to\nCapi Fitness Appliccation")
                .font(.quicksand(.bold, size: 24))
                .foregroundColor(Color.darkColor)
                .multilineTextAlignment(.center)
                .offset(x: 0, y: 10)
            
            Text("Personalized workouts will help you\ngain strength, get in better shape and\nembrace a healthy lifestyle")
                .font(.quicksand(.regular, size: 16))
                .foregroundColor(Color.darkColor)
                .multilineTextAlignment(.center)
                .offset(x: 0, y: 10)
        }
        .offset(x: 0, y: -30)
        .ignoresSafeArea()
    }
}

struct CFAStep1_Previews: PreviewProvider {
    static var previews: some View {
        CFAStep1()
    }
}
