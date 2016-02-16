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
            if let validItem = item.historicalData["PlanetOfOrigin"]{
                if(validItem as! String == planet){
                    itemList.append(item)
                }
            }
            else{
                print("Missing PlanetOfOrigin key!!")
            }
        }
        return itemList
    }
}
