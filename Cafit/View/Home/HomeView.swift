//
//  HomeView.swift
//  Cafit
//
//  Created by Topstar88 on 12/6/21.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selectedExe = 0
    @State private var currentCard = 0
    @State private var selection: Int?
    @State private var presentModal = false
    @ObservedObject var viewModel = ExerciseViewModel()
    
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = UIColor.primaryColor
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Quicksand-Bold", size: 20)!]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Quicksand-Bold", size: 20)! ]
               
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            Spacer()
                .frame(height: 100)
            ACarousel(viewModel.cards,
                      index: $currentCard,
                      spacing: 110,
                      headspace: 0,
                      sidesScaling: 0.8,
                      isWrap: false,
                      autoScroll: .inactive) { item in
                ZStack(alignment: .bottomLeading, content: {
                    AsyncImage(url: URL(string: item.image)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(10)
                            .opacity(viewModel.cards.firstIndex(of: item) == currentCard ? 1 : 0.5)
                    } placeholder: {
                        Image("placeholder")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 160)
                            .background(Color(hex: 0x8C8C8C))
                            .opacity(viewModel.cards.firstIndex(of: item) == currentCard ? 1 : 0.5)
                            .clipped()
                            .cornerRadius(10)
                    }
                    Text(item.subtitle)
                        .font(.quicksand(.bold, size: 16))
                        .foregroundColor(.white)
                        .padding(20)
                    
                })
               }
                .frame(height: 160)
                .padding([.top, .bottom], 33)
            
            VStack {
                Text("Training Day 1")
                    .font(.quicksand(.bold, size: 24))
                    .foregroundColor(Color.darkColor)
                    .padding([.bottom], 10)
                Text("Week 1")
                    .font(.quicksand(.bold, size: 16))
                    .foregroundColor(Color.darkColor)
                
                ScrollView {
                    ForEach(Array(viewModel.items.enumerated()), id: \.offset) { index, item in
                        ExerciseView(index: index, color: selectedExe == index ? Color.primaryColor : Color(hex: 0x949397), borderColor: selectedExe == index ? Color(hex: 0xFFCE00).opacity(0.5) : Color(hex: 0x949397).opacity(0.5), title: item.title, mins: item.subtitle)
                            .padding([.leading, .trailing], 30)
                            .padding([.top, .trailing], 20)
                            .alert(isPresented: $presentModal, content: {
                                Alert(title: Text("Cafit"), message: Text("You already finished this course"), dismissButton: nil)
                            })
                            .onTapGesture {
                                if index == 2 {
                                    self.presentModal = true
                                } else {
                                    self.selectedExe = index
                                }
                            }
                    }
                }
                
                Button {
                    
                } label: {
                    Text("Start")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .font(.quicksand(.bold, size: 20))
                }
                .background(Color.primaryColor)
                .frame(width: 200, height: 50)
                .cornerRadius(25)

            }
            .padding([.top], 15)
            .padding([.bottom], 40)
            .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).fill(.white))
            .clipped()
            .padding([.leading, .trailing], 20)
            .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 0)

            Spacer()
                .frame(height: 70)
        })
        .ignoresSafeArea()
        .navigationBarTitle("Capi Fitness Application")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image("ic_back")
            })
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
