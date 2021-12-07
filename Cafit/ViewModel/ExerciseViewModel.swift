//
//  ExerciseViewModel.swift
//  Cafit
//
//  Created by Topstar88 on 12/6/21.
//

import Foundation


class ExerciseViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    @Published var cards: [Item] = []
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        // call backend api
        items.append(Item(title: "Exercises 1", subtitle: "7 min", image: ""))
        items.append(Item(title: "Exercises 2", subtitle: "15 min", image: ""))
        items.append(Item(title: "Finished", subtitle: "5 min", image: ""))
        
        
        cards.append(Item(title: "Card 1", subtitle: "Running", image: "https://gomarquette.com/images/2021/10/28/Lovell_5k.png"))
        cards.append(Item(title: "Card 2", subtitle: "Breathing", image: "https://www.gundersenhealth.org/app/files/public/11706/live-happy-4-7-8-Breathing-Technique.png"))
        cards.append(Item(title: "Card 3", subtitle: "Exercise", image: "https://cdn10.phillymag.com/wp-content/uploads/sites/3/2018/01/fitness-events-yoga-istock-Antonio_Diaz-900x600.jpg"))
    }
}
