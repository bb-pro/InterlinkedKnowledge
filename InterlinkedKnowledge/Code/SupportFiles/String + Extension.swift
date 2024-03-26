//
//  String + Extension.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 26/3/2024.
//

import Foundation

extension String {
    func dividedBySlash() -> String {
        guard count >= 6 else {
            return self
        }

        let index = index(startIndex, offsetBy: 3)
        let firstPart = self[..<index]
        let secondPart = self[index...]
        return "\(firstPart)/\(secondPart)"
    }
}
