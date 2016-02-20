//
//  ItemComparison.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

func <(lhs: UDItem, rhs: UDItem) -> Bool {
    
    // Rarity value is less? Obviously less rare
    if lhs.rarity.rawValue > rhs.rarity.rawValue{
        return false
    }
    
    // Base value is less? Also less rare
    if lhs.baseValue > rhs.baseValue{
        return false
    }
    
    // We've determined that the left item is less rare
    // than the right item. Woo!
    return true
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 5"