//
//  UITableView+SectionRotor.swift
//  AccessibilityExamples
//
//  Created by Mikhail Rubanov on 17.04.2021.
//

import UIKit

extension UITableView {
    
    func sectionRotor(title: String) -> UIAccessibilityCustomRotor {
        UIAccessibilityCustomRotor(name: title, itemSearch: handleRotorResult)
    }
    
    private func handleRotorResult(predicate: UIAccessibilityCustomRotorSearchPredicate) -> UIAccessibilityCustomRotorItemResult? {
        guard let newPath = nextSection(direction: predicate.searchDirection) else {
            return nil }
        
        scrollToRow(at: newPath, at: .middle, animated: false)
        
        guard let firstCell = cellForRow(at: newPath) else { return nil }
        
        UIAccessibility.post(notification: .layoutChanged, argument: firstCell)
                
        return UIAccessibilityCustomRotorItemResult(targetElement: firstCell, targetRange: nil)
    }
    
    private func nextSection(direction: UIAccessibilityCustomRotor.Direction) -> IndexPath? {
        guard let focusedPath = focusedPath(direction: direction) else {
            return nil
        }
        
        var newSection = focusedPath.section
        
        switch direction {
        case .next:     newSection += 1
        case .previous: newSection -= 1
        @unknown default: return nil
        }
        
        let searchSection = min(numberOfSections - 1, max(0, newSection))
        
        return IndexPath(row: 0, section: searchSection)
    }
    
    private func focusedPath(direction: UIAccessibilityCustomRotor.Direction) -> IndexPath? {
        switch direction {
        case .next:
            return indexPathsForVisibleRows?.last
        case .previous:
            return indexPathsForVisibleRows?.first
        @unknown default:
            return nil
        }
    }
}
