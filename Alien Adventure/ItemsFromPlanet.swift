//
//  ItemsFromPlanet.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func itemsFromPlanet(inventory: [UDItem], planet: String) -> [UDItem] {
        var itemList = [UDItem]()
        
        for item: UDItem in inventory{
            for key in item.historicalData{
                // Unwrap object data
                if key.1 as? String == planet{
                    itemList.append(item)
                    print("Appending: ", item)
                }
                else{
                    print(key.1, " does not match ", planet)
                }
            }
        }
        return itemList
    }
}
