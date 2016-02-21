//
//  MostCommonCharacter.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func mostCommonCharacter(inventory: [UDItem]) -> Character? {
        var charList = [Character:Int]()
        
        // Pump all characters into a dictionary
        for item in inventory{
            for char in item.name.lowercaseString.characters{
                if let _ = charList[char]{ // Char already in the list? Increment its value.
                    charList[char]?++
                }
                else{ // Char not in the list? Initialize.
                    charList[char] = 0
                }
            }
        }
        
        // Sort the list by value
        let sortedChars = charList.sort { $0.1 > $1.1 }
    
        // Return the highest valued character
        if let highestChar = sortedChars.first?.0{
            return highestChar
        }
        
        return nil
    }
}
