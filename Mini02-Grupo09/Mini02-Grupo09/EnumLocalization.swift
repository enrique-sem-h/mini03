//
//  EnumLocalization.swift
//  Mini02-Grupo09
//
//  Created by Enrique Carvalho on 02/10/23.
//

import Foundation

protocol EnumLocalization: Identifiable, CaseIterable, RawRepresentable where RawValue: StringProtocol{}

extension EnumLocalization{
    var localized: String {
            NSLocalizedString(String(rawValue), comment: "")
        }
        
        var id: String {
            String(self.rawValue)
        }
}
