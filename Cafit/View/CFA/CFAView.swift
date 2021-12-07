//
//  CFAView.swift
//  Cafit
//
//  Created by Topstar88 on 12/5/21.
//

import SwiftUI

struct CFAView: View {
    @State private var currentTab = 0
    
    @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
    private var viewController: UIViewController? {
        self.viewControllerHolder.value
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Text("Step \(currentTab + 1) of 3")
                .font(.quicksand(.bold, size: 20))
                .foregroundColor(Color.primaryColor)
                .offset(x: 0, y: 50)
            TabView(selection: $currentTab, content:  {
                CFAStep1().tag(0)
                CFAStep2().tag(1)
                CFAStep3().tag(2)
            })
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .edgesIgnoringSafeArea([.top, .bottom])
            Group {
                Button(action: {
                    if currentTab == 2 {
                        self.viewController?.present(style: .fullScreen) { MenuView() }
                    } else {
                        withAnimation {
                            currentTab = min(currentTab + 1, 2)
                        }
                    }
                }, label: {
                    Text(currentTab == 0 ? "Get Started" : "Next")
                        .font(.quicksand(.bold, size: 20))
                        .foregroundColor(.white)
                })
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.primaryColor)
                    .cornerRadius(25)
                    .padding([.leading, .trailing], 30)
                    .padding([.bottom], 100)
                PageControl(numberOfPages: 3, currentPage: $currentTab)
                    .padding([.bottom], 50)
                    .onAppear {
                        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.primaryColor
                        UIPageControl.appearance().pageIndicatorTintColor = UIColor.darkColor
                    }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .ignoresSafeArea()
    }
}

struct CFAView_Previews: PreviewProvider {
    static var previews: some View {
        CFAView()
    }
}
