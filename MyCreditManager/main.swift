//
//  main.swift
//  MyCreditManager
//
//  Created by 김지수 on 2023/04/26.
//

import Foundation

let manager = MemberManager()

func setMainMenuAndReadCommand() {
    
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    
    /// 입력
    if let input = readLine(),
       let command = CommandType(rawValue: input) {
        
        commandAction(command: command)
        
    } else {
        print("잘못된 입력입니다")
        setMainMenuAndReadCommand()
    }
}

func commandAction(command: CommandType) {
    switch command {
    case .addMember:
        command.printGuide()
        if let name = readLine(), name != "" {
            manager.addMember(name)
            setMainMenuAndReadCommand()
        } else {
            ErrorType.invalidInput.printDescription()
        }
        
    case .deleteMember:
        command.printGuide()
        if let name = readLine(), name != "" {
            manager.deleteMember(name)
            setMainMenuAndReadCommand()
        } else {
            ErrorType.invalidInput.printDescription()
        }
    case .addCredit:
        command.printGuide()
        let input = readLine()!.split(separator: " ").map { return String($0) }
        if !input[0].isEmpty, !input[1].isEmpty, !input[2].isEmpty {
            let name = input[0]
            let subject = input[1]
            guard let grade = CreditModel.Grade(rawValue: input[2]) else {
                ErrorType.invalidInput.printDescription()
                setMainMenuAndReadCommand()
                return
            }
            manager.addCredit(name: name, subject: subject, credit: grade)
            setMainMenuAndReadCommand()
        } else {
            ErrorType.invalidInput.printDescription()
        }
        
    case .deleteCredit:
        command.printGuide()
        let input = readLine()!.split(separator: " ").map { return String($0) }
        if !input[0].isEmpty, !input[1].isEmpty {
            let name = input[0]
            let subject = input[1]
            manager.deleteCredit(name: name, subject: subject)
        } else {
            ErrorType.invalidInput.printDescription()
        }
        
    case .showCredit:
        command.printGuide()
        if let input = readLine() {
            manager.showCredit(name: input)
        } else {
            ErrorType.invalidInput.printDescription()
        }
        
    case .exit:
        _exit(0)
    }
    
    setMainMenuAndReadCommand()
}

setMainMenuAndReadCommand()
