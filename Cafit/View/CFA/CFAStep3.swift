//
//  CFAStep3.swift
//  Cafit
//
//  Created by Polaris on 12/5/21.
//

import SwiftUI

struct CFAStep3: View {
    @State private var isSoundOn: Bool = true
    @State private var selectedGender: Int = 0
    
    var body: some View {
        VStack {
            Text("Personal Details")
                .font(.quicksand(.bold, size: 24))
                .foregroundColor(Color.darkColor)
                .padding([.bottom], 20)
            Text("Let us know about you to speed up the\nresult, Get fit with your personal workout\nplan!")
                .font(.quicksand(.regular, size: 16))
                .foregroundColor(Color.darkColor)
                .multilineTextAlignment(.center)
                .padding([.bottom], 35)
                Group {
                    Spacer()
                        .frame(maxHeight: 25)
                    Text("Apple Health")
                        .font(.quicksand(.bold, size: 20))
                        .foregroundColor(
                            Color(red: 110/255, green: 110/255, blue: 110/255, opacity: 1)
                        )
                    Spacer()
                        .frame(maxHeight: 8)
                    ZStack(alignment: .leading) {
                        Text("Allow access ti fill my parameters")
                            .font(.quicksand(.regular, size: 16))
                            .foregroundColor(Color.darkColor)
                            .padding([.leading], 5)
                        Group {
                            Toggle("", isOn: $isSoundOn)
                                .tint(Color.primaryColor)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                        .frame(maxHeight: 20)
                    Rectangle()
                        .fill(Color.lightGrayColor)
                        .frame(maxWidth: .infinity, maxHeight: 1)
                }
                .padding([.leading, .trailing], 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onTapGesture {
                    
                }
                
            ForEach(0...2, id: \.self) { index in
                Group {
                    Spacer()
                        .frame(maxHeight: 25)
                    ZStack(alignment: .leading) {
                        Text(index == 0 ? "Birthday" : (index == 1 ? "Height" : "Weight"))
                            .font(.quicksand(.bold, size: 20))
                            .foregroundColor(Color.darkColor)
                        Group {
                            Text(index == 0 ? "Aug 25, 1990" : (index == 1 ? "175 cm" : "75 kg"))
                                .font(.quicksand(.regular, size: 18))
                                .foregroundColor(Color.primaryColor)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    Spacer()
                        .frame(maxHeight: 20)
                    Rectangle()
                        .fill(Color.lightGrayColor)
                        .frame(maxWidth: .infinity, maxHeight: 1)
                }
                .padding([.leading, .trailing], 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onTapGesture {
                    
                }
            }
            Group {
                Spacer()
                    .frame(maxHeight: 25)
                ZStack(alignment: .leading) {
                    Text("Gender")
                        .font(.quicksand(.bold, size: 20))
                        .foregroundColor(Color.darkColor)
                    Group {
                        HStack(spacing: 0.0) {
                            Button(action: {
                                selectedGender = 0
                            }, label: {
                                Text("Male")
                                    .font(.quicksand(.regular, size: 18))
                                    .foregroundColor(selectedGender == 0 ? .white : Color.primaryColor)
                            })
                                .frame(width: 75, height: 30)
                                .background(selectedGender == 0 ? Color.primaryColor : .white)
                                .cornerRadius(5)
                            
                            Button(action: {
                                selectedGender = 1
                            }, label: {
                                Text("Female")
                                    .font(.quicksand(.regular, size: 18))
                                    .foregroundColor(selectedGender == 1 ? .white : Color.primaryColor)
                            })
                                .frame(width: 75, height: 30)
                                .background(selectedGender == 1 ? Color.primaryColor : .white)
                                .cornerRadius(5)
                        }
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.primaryColor, lineWidth: 1.5))
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                Spacer()
                    .frame(maxHeight: 20)
            }
            .padding([.leading, .trailing], 25)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .offset(x: 0, y: 150)
        .ignoresSafeArea()
    }
}

struct CFAStep3_Previews: PreviewProvider {
    static var previews: some View {
        CFAStep3()
    }
}
