//
//  BannedItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

let bannedString = "laser"
let bannedAge = 30
extension Hero {
    
    func bannedItems(dataFile: String) -> [Int] {
        var banList = [Int]()
        
        // Start by loading the PList
        let dataFileURL = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "plist")!
        let plistData = NSArray(contentsOfURL: dataFileURL)!

        // This monstrosity will loop through our plist and
        // extract Name, HistoricalData, CarbonAge, and ItemID
        // If the name contains bannedString and the CarbonAge > bannedAge, save the ItemID
        for key in plistData
        {
            if let name = key.objectForKey("Name") as? String{
                if name.lowercaseString.containsString(bannedString){
                    if let history = key.objectForKey("HistoricalData") as? [String:AnyObject]{
                        // Loop through history dictionary
                        for hist_key in history {
                            if hist_key.0 == "CarbonAge" && (hist_key.1 as! Int) < bannedAge{
                                // Found a bannable item. Save the itemID!
                                if let itemID = key.objectForKey("ItemID") as? Int{
                                    banList.append(itemID)
                                }
                            }
                        }
                    }
                }
            }
        } // Arrrrgh, braces!
    
        return banList
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 6"