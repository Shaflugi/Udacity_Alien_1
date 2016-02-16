//
//  OldestItemFromPlanet.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func oldestItemFromPlanet(inventory: [UDItem], planet: String) -> UDItem? {
        
        let validItems = itemsFromPlanet(inventory, planet: planet)
        var oldestItem: UDItem
        
        // No items? Break out early and return nothingess.
        if validItems.count == 0 {
            return nil
        }
        
        // Initialize oldestItem with some data.
        oldestItem = validItems[0]
        
        // Loop through each item to determine
        // which is the oldest
        for item:UDItem in validItems {
            if let carbonAge = item.historicalData["CarbonAge"] {
                if let oldestAge = oldestItem.historicalData["CarbonAge"]{
                    if carbonAge as! Int > oldestAge as! Int {
                        oldestItem = item
                    }
                }
            }
        }
        return oldestItem
    }
}
