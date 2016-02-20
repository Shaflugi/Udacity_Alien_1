//
//  XORCipherKeySearch.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func xorCipherKeySearch(encryptedString: [UInt8]) -> UInt8 {
        var key: UInt8
        key = 0
        
        // Check every value between 0-255
        for x in UInt8.min..<UInt8.max {
            
            var decrypted: [UInt8]
            decrypted = [UInt8]()
            
            // XOR the value of x against the characters in the encrypted string
            for character in encryptedString {
                decrypted.append(character ^ x)
            }
            
            // Does our decrypted string say "udacity?"
            // If so, great! We found the key for decryption.
            if let decryptedString = String(bytes: decrypted,
                encoding: NSUTF8StringEncoding) where decryptedString == "udacity" {
                    key = x
            }
        }
        
        return key
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 3"