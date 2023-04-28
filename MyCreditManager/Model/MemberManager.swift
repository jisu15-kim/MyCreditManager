//
//  MemberManager.swift
//  MyCreditManager
//
//  Created by 김지수 on 2023/04/26.
//

import Foundation

class MemberManager {
    //MARK: - Properties
    /// 데이터
    private var memberDatas: [Member] = []
    
    //MARK: - GetSelectedMember
    /// memberDatas에서 선택한 이름의 데이터를 리턴
    /// 값이 없을경우 nil값 리턴
    func getSelectedMember(name: String, completion: (Member?, Int?) -> Void) {
        var selectedMember: Member? = nil
        var index: Int? = nil
        memberDatas.enumerated().forEach {
            if $1.name == name {
                selectedMember = memberDatas[$0]
                index = $0
            }
        }
        completion(selectedMember, index)
        if selectedMember == nil || index == nil {
            ErrorType.invalidName.printDescription(value: name)
        }
    }
    
    //MARK: - Member 관련
    func addMember(_ name: String) {
        let newMember = Member(name)
        memberDatas.append(newMember)
        print("\(name) 학생을 추가했습니다.")
    }
    
    func deleteMember(_ name: String) {
        getSelectedMember(name: name) { member, index in
            guard let index = index else { return }
            memberDatas.remove(at: index)
        }
    }
    
    //MARK: - Credit 관련
    func addCredit(name: String, subject: String, credit: CreditModel.Grade) {
        getSelectedMember(name: name) { member, index in
            guard let index = index else { return }
            let credit = CreditModel(subject: subject, credit: credit)
            memberDatas[index].credit.append(credit)
            print("\(name) 학생의 \(subject) 과목이 \(credit.credit.rawValue)로 추가(변경) 되었습니다")
        }
    }
    
    func deleteCredit(name: String, subject: String) {
        var isValidSubject = false
        getSelectedMember(name: name) { member, index in
            guard let member = member,
                  let index = index else { return }
            member.credit.enumerated().forEach {
                if $1.subject == subject {
                    memberDatas[index].credit.remove(at: $0)
                    isValidSubject = true
                }
            }
        }
        if isValidSubject == false {
            ErrorType.invalidSubject.printDescription(value: subject)
        }
    }
    
    func showCredit(name: String) {
        
        getSelectedMember(name: name) { (member, index) in
            guard let member = member else { return }
            member.credit.forEach { credit in
                credit.showCredit()
            }
        }
    }
}
