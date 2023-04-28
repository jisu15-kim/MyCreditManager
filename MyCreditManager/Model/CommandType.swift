//
//  InputType.swift
//  MyCreditManager
//
//  Created by 김지수 on 2023/04/26.
//

import Foundation

enum CommandType: String {
    case addMember = "1"
    case deleteMember = "2"
    case addCredit = "3"
    case deleteCredit = "4"
    case showCredit = "5"
    case exit = "X"
    
    func printGuide() {
        switch self {
        case .addMember:
            print("추가할 학생의 이름을 입력해주세요")
        case .deleteMember:
            print("삭제할 학생의 이름을 입력해주세요")
        case .addCredit:
            print("성적을 추가할 학생의 이름, 과목, 성적(A+, A, F 등)을 띄워쓰기로 구분하여 차례로 작성해주세요. \n 입력 예) Mickey Swift A+ \n 만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다")
        case .deleteCredit:
            print("성적을 삭제할 학생의 이름, 과목을 띄워쓰기로 구분하여 차례로 작성하여 주세요. \n 입력 예) Mickey Swift")
        case .showCredit:
            print("평점을 알고 싶은 학생의 이름을 입력해주세요")
        case .exit:
            print("프로그램을 종료합니다...")
        }
    }
}
