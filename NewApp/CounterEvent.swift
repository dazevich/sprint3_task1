//
//  CounterEvent.swift
//  NewApp
//
//  Created by Даниил Азевич on 22.11.2023.
//

import Foundation

enum CounterEvent {
    case increment
    case decrement
    case refresh
    case error
}

extension CounterEvent {
    func toEventDesc() -> String {
        let timestamp = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        var event = ""
        switch(self) {
        case .increment:
            event = "значение изменено на +1"
            break;
        case .decrement:
            event = "значение изменено на -1"
            break;
        case .refresh:
            event = "значение сброшено"
            break;
        case .error:
            event = "попытка уменьшить значение счётчика ниже 0"
            break;
        }
        
        return "[\(dateFormatter.string(from: timestamp))]: \(event)";
    }
}
