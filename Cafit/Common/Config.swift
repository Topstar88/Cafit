//
//  Config.swift
//  Cafit
//
//  Created by Topstar88 on 12/6/21.
//

import Foundation

class Config {
    static var shared = Config()
    var menuData = [
        Item(title: "Home", subtitle: "", image: "menu-home"),
        Item(title: "Weight", subtitle: "", image: "menu-weight"),
        Item(title: "Traning plan", subtitle: "", image: "menu-plan"),
        Item(title: "Training Stats", subtitle: "", image: "menu-stats"),
        Item(title: "Meal Plan", subtitle: "", image: "menu-meal-plan"),
        Item(title: "Schedule", subtitle: "", image: "menu-schedule"),
        Item(title: "Running", subtitle: "", image: "menu-running"),
        Item(title: "Exercises", subtitle: "", image: "menu-exercises"),
        Item(title: "Tips", subtitle: "", image: "menu-tips"),
        Item(title: "Settings", subtitle: "", image: "menu-settings"),
        Item(title: "Support", subtitle: "", image: "menu-support")
    ]
    
    var onboardingData = [
        Item(title: "Have a good health", subtitle: "Being healthy is all, no health is nothing.\nSo why do not we", image: "onboarding-object1"),
        Item(title: "Be stronger", subtitle: "Take 30 minutes of bodybuilding every day\nto get physically fit and healthy.", image: "onboarding-object2"),
        Item(title: "Have nice body", subtitle: "Bad body shape, poor sleep, lack of strength,\nweight gain, weak bones, easily traumatized\nbody, depressed, stressed, poor metabolism,\npoor resistance", image: "onboarding-object3")
    ]
}
