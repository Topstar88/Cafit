//
//  Session.swift
//  Cafit
//
//  Created by Topstar88 on 12/6/21.
//

import Foundation

class User: Codable{
    let id: Int
    let name: String
    let avatar: String
    
    init(id: Int, name: String, avatar: String) {
        self.id = id
        self.name = name
        self.avatar = avatar
    }
}

class Session {
    static var shared = Session()
    let account: User
    
    init() {
        self.account = User(id: 0, name: "Capi Creative Design", avatar: "")
    }
}
