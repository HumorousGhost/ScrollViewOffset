//
//  OffsetPreferenceKey.swift
//  
//
//  Created by Liqun Zhang on 2022/12/7.
//

import SwiftUI

struct OffsetPreferenceKey: PreferenceKey {
    
    typealias Value = CGFloat
    
    static var defaultValue: CGFloat {
        return .zero
    }
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        
    }
}
