//
//  TableViewController.swift
//  AccessibilityExamples
//
//  Created by Mikhail Rubanov on 31.01.2021.
//

import UIKit

class TableViewController: UITableViewController {

    var products = Product.allCases
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        isAccessibilityElement = true
        accessibilityTraits = .button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        accessibilityCustomRotors = [tableView.sectionRotor(title: "Тип продуктов")]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = product.description

        return cell
    }
}
