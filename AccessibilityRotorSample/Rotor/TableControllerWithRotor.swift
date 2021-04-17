//
//  TableControllerWithRotor.swift
//  AccessibilityExamples
//
//  Created by Mikhail Rubanov on 17.04.2021.
//

import Foundation

class TableControllerWithRotor: TableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accessibilityCustomRotors = [tableView.sectionRotor(title: "Тип продуктов")]
    }
}
