//
//  MemberModel.swift
//  MyCreditManager
//
//  Created by 김지수 on 2023/04/26.
//

import Foundation

struct Member {
    let name: String
    var credit: [CreditModel]
    
    init(_ name: String) {
        self.name = name
        self.credit = []
    }
}

struct CreditModel {
    
    enum Grade: String {
        case APlus = "A+"
        case A = "A"
        case AMinus = "A-"
        case BPlus = "B+"
        case B = "B"
        case BMinus
        case CPlus = "C+"
        case C = "C"
        case CMinus = "C-"
        case D = "D"
        case F = "F"
    }
    
    let subject: String
    var credit: Grade
    
    func showCredit() {
        print("\(subject): \(credit.rawValue)")
    }
}
