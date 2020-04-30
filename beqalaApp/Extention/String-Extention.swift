//
//  String-Extention.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/18/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import Foundation

extension String {
    
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
