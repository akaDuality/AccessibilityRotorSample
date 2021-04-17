//
//  Product.swift
//  AccessibilityExamples
//
//  Created by Mikhail Rubanov on 17.04.2021.
//

enum Product: CaseIterable {
    case pizza
    case combo
    case drinks
}

extension Product: CustomStringConvertible {
    var description: String {
        switch self {
        case .pizza:  return "Пицца"
        case .combo:  return "Комбо"
        case .drinks: return "Напитки"
        }
    }
}
