//
//  MenuView.swift
//  Cafit
//
//  Created by Topstar88 on 12/6/21.
//

import SwiftUI

struct MenuView: View {
    @State private var selection: Int?
    @State private var showDetail = false
    
    var body: some View {
        let columns = [
            GridItem(.flexible(), spacing: 5, alignment: .center),
            GridItem(.flexible(), spacing: 5, alignment: .center),
            GridItem(.flexible(), spacing: 5, alignment: .center)
        ]
        NavigationView {
            VStack {
                Group {
                    HStack {
                        Spacer()
                            .frame(width: 25)
                        AsyncImage(url: URL(string: Session.shared.account.avatar)) { image in
                            image
                                .resizable()
                        } placeholder: {
                            Image("logo")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .background(Color(hex: 0xDDDDDD))
                                .overlay(Circle().stroke(.white, lineWidth: 2))
                                .cornerRadius(20)
                        }
                        VStack(alignment: .leading) {
                            Text(Session.shared.account.name)
                                .font(.quicksand(.bold, size: 20))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                            Text("Profile")
                                .font(.quicksand(.medium, size: 16))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 210, alignment: .bottomLeading)
                .padding([.bottom], 30)
                .background(Color(hex: 0x8D8D8D))
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(Array(Config.shared.menuData.enumerated()), id: \.offset) { index, item in
                            
                            NavigationLink {
                                if index == 0 {
                                    HomeView()
                                } else {
                                    Text(item.title)
                                }
                            } label: {
                                VStack(alignment: .center , spacing: 18) {
                                    Image(item.image)
                                        .frame(width: 35, height: 35)
                                    Text(item.title)
                                        .font(.quicksand(.bold, size: 14))
                                        .foregroundColor(Color.darkColor)
                                }
                                .frame(width: 100, height: 100)
                            }
                        }
                    }
                    .padding([.top], 20)
                }
            }
            .navigationBarHidden(true)
        }
        .ignoresSafeArea()
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
