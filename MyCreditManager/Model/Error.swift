//
//  Error.swift
//  MyCreditManager
//
//  Created by 김지수 on 2023/04/26.
//

import Foundation

enum ErrorType {
    case invalidName
    case invalidSubject
    case invalidInput
    
    func printDescription(value: String = "") {
        switch self {
        case .invalidName:
            print("\(value) 학생을 찾지 못했습니다.")
        case .invalidSubject:
            print("\(value) 과목을 찾지 못했습니다.")
        case .invalidInput:
            print("잘못된 입력입니다.")
        }
    }
}
