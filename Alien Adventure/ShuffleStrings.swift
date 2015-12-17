//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func shuffleStrings(s1 s1: String, s2: String, shuffle: String) -> Bool {
        // All strings are empty. This technically is a valid shuffle string.
        if(s1 == "" && s2 == "" && shuffle == ""){
            return true
        }
        
        // Early out: s1 + s2 length doesn't match shuffle length
        if (s1.characters.count + s2.characters.count != shuffle.characters.count)
        {
            return false
        }
        
        // Check the first string
        for index in s1.characters.indices{
            // We've reached the end of the string
            // Break from the loop or the app will break!
            if index.successor() >= s1.endIndex{
                break
            }
            let indexCheck1 = s1[index]
            let indexCheck2 = s1[index.successor()]
            
            // I'm almost certain this will only work if s1 and s2 are two characters long, but who knows?
            if(shuffle.characters.indexOf(indexCheck1) > shuffle.characters.indexOf(indexCheck2)){
                return false
            }
        }
        
        // Check the second string
        for index in s2.characters.indices{
            // We've reached the end of the string
            // Break from the loop or the app will break!
            if index.successor() >= s2.endIndex{
                break
            }
            let indexCheck1 = s2[index]
            let indexCheck2 = s2[index.successor()]
            
            if(shuffle.characters.indexOf(indexCheck1) > shuffle.characters.indexOf(indexCheck2)){
                return false
            }
        }
    
        return true
    }
}
