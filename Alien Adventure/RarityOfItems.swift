//
//  RarityOfItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func rarityOfItems(inventory: [UDItem]) -> [UDItemRarity:Int] {
        var rareList = [UDItemRarity:Int]()
       
        // Init dict (how to do this in a loop..?)
        rareList[UDItemRarity.Common] = 0
        rareList[UDItemRarity.Uncommon] = 0
        rareList[UDItemRarity.Rare] = 0
        rareList[UDItemRarity.Legendary] = 0

        // Increment rarity values
        for item in inventory{
            switch(item.rarity){
            case .Common:
                print("common found")
                rareList[UDItemRarity.Common]?++
            case .Uncommon:
                print("uncommon found")
                rareList[UDItemRarity.Uncommon]?++
            case .Rare:
                print("Rare found")
                rareList[UDItemRarity.Rare]?++
            case.Legendary:
                print("legendary found")
                rareList[UDItemRarity.Legendary]?++
            }
        }

        return rareList
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 4"