//
//  ContentView.swift
//  Cafit
//
//  Created by Topstar88 on 12/5/21.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentTab = 0
    
    @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
    private var viewController: UIViewController? {
        self.viewControllerHolder.value
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentTab, content:  {
                ForEach(Array(Config.shared.onboardingData.enumerated()), id: \.offset) { index, item in
                    OnboardingPage(item.title, item.subtitle, item.image).tag(Config.shared.onboardingData.firstIndex(of: item))
                        .tag(index)
                }
            })
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .edgesIgnoringSafeArea([.top, .bottom])
            PageControl(numberOfPages: 3, currentPage: $currentTab)
                .padding([.bottom], 115)
                .onAppear {
                    UIPageControl.appearance().currentPageIndicatorTintColor = .white
                    UIPageControl.appearance().pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.5)
                }
            ZStack() {
                Button(action: {
                    self.viewController?.present(style: .fullScreen) { CFAView() }
                }, label: {
                    Text("Start")
                        .font(.quicksand(.bold, size: 20))
                        .foregroundColor(Color.primaryColor)
                })
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(.white)
                    .cornerRadius(25)
            }
            .padding([.leading, .trailing], 30)
            .padding([.bottom], 50)
            
        }
        .background(content: {
            Image("onboarding-background")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .scaledToFill()
                .aspectRatio(1, contentMode: .fit)
        })
        .ignoresSafeArea()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
