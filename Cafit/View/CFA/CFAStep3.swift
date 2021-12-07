//
//  CFAStep3.swift
//  Cafit
//
//  Created by Topstar88 on 12/5/21.
//

import SwiftUI

struct CFAStep3: View {
    @State private var isSwitchOn: Bool = true
    @State private var selectedGender: Int = 0
    
    @State private var isShowBirthModal = false
    @State private var isShowHeightModal = false
    @State private var isShowWeightModal = false
    @State private var birthday = "Jan 1, 1990"
    @State private var weight = "65"
    @State private var height = "175"
    
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
                            Toggle("", isOn: $isSwitchOn)
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
                            
            ForEach(0...2, id: \.self) { index in
                Group {
                    Spacer()
                        .frame(maxHeight: 25)
                    ZStack(alignment: .leading) {
                        Text(index == 0 ? "Birthday" : (index == 1 ? "Height" : "Weight"))
                            .font(.quicksand(.bold, size: 20))
                            .foregroundColor(Color.darkColor)
                        Group {
                            Text(index == 0 ? self.birthday : (index == 1 ? "\(self.height) cm" : "\(self.weight) kg"))
                                .font(.quicksand(.regular, size: 18))
                                .foregroundColor(Color.primaryColor)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .onTapGesture {
                        if index == 0 {
                            self.isShowBirthModal = true
                        } else if index == 1 {
                            self.isShowHeightModal = true
                        } else {
                            self.isShowWeightModal = true
                        }
                    }
                                        
                    Spacer()
                        .frame(maxHeight: 20)
                    
                    Rectangle()
                        .fill(Color.lightGrayColor)
                        .frame(maxWidth: .infinity, maxHeight: 1)
                }
                .padding([.leading, .trailing], 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                AlertControlView(textString: index == 0 ? $birthday : (index == 1 ? $height : $weight), showAlert: index == 0 ? $isShowBirthModal : (index == 1 ? $isShowHeightModal : $isShowWeightModal), title: "Cafit",
                                 message: index == 0 ? "Please enter your birthday below." : (index == 1 ? "Please enter your height below." : "Please enter your weight below."), placeholder: "", type: index == 0 ? UIKeyboardType.default : UIKeyboardType.decimalPad)
                    .frame(maxHeight: 0)
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
