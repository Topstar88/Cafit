//
//  OnboardingPage.swift
//  Onboarding Quality Weather
//
//  Created by Tony on 05/12/2021.
//

import SwiftUI

struct OnboardingPage: View {
    @State private var isAnimating: Bool = false
    var title: String
    var subTitle: String
    var image: String

    init(_ title: String, _ subTitle: String, _ image: String) {
        self.title = title
        self.subTitle = subTitle
        self.image = image
    }
    
    var body: some View {
        VStack() {
            Text(title)
                .font(.quicksand(.bold, size: 24))
                .offset(x: 0, y: 70)
                .foregroundColor(Color.primaryColor)
            Image(image)
                .resizable()
                .scaledToFit()
                .offset(x: 0, y: 200)
                .frame(width: 270, height: 270, alignment: .center)
                .scaleEffect(isAnimating ? 1 : 0.9)

            Spacer()
            
            GeometryReader { geo in
                ZStack() {
                    Text(subTitle)
                            .font(.quicksand(.regular, size: 14))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                }
                .offset(x: 0, y: geo.size.height - 150)
                .padding([.leading, .trailing], 35)
            }
            
            Spacer()
                .frame(height: 115)
        }
        .onAppear(perform: {
            isAnimating = false
            withAnimation(.easeOut(duration: 0.5)) {
                self.isAnimating = true
            }
        })
        .edgesIgnoringSafeArea([.all])
    }
}

struct OnboardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage("Title", "SubTitle", "onboarding-object1")
    }
}
