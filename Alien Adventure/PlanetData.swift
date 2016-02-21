//
//  PlanetData.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//
import Foundation

// Define how many points an item is worth.
enum ItemPoints: Int{
    case Common = 1, Uncommon, Rare, Legendary
}

// Set up a struct to hold planet scores and such
struct PlanetData{
    var Name: String
    var Commons: Int
    var Uncommons: Int
    var Rares: Int
    var Legendaries: Int
    var Score: Int
    
    init() {
        Name = "Dummy"
        Commons = 0
        Uncommons = 0
        Rares = 0
        Legendaries = 0
        Score = 0
    }
    
    mutating func CalculateScore(){
        self.Score += Commons * ItemPoints.Common.rawValue
        self.Score += Uncommons * ItemPoints.Uncommon.rawValue
        self.Score += Rares * ItemPoints.Rare.rawValue
        self.Score += Legendaries * ItemPoints.Legendary.rawValue
    }
}

extension Hero {
    
    func planetData(dataFile: String) -> String {
        
        
        
        let jsonURL = NSBundle.mainBundle().URLForResource("PlanetData", withExtension: "json")!
        let rawData = NSData(contentsOfURL: jsonURL)!
        
        //print("Jaaasonnn: ", jsonData)
        // Load json data into dictionary
        var jsonData: NSArray!
        do {
            jsonData = try! NSJSONSerialization.JSONObjectWithData(rawData,
                options: NSJSONReadingOptions()) as! NSArray
        }
        
        var planetList = [PlanetData]()
        
        // Pull all raw JSON data into a nice struct
        for item in jsonData{
            var planet = PlanetData()
            for key in item as! [String:AnyObject]{
                switch(key.0){
                case "Name":
                    planet.Name = key.1 as! String
                case "CommonItemsDetected":
                    planet.Commons = key.1 as! Int
                case "UncommonItemsDetected":
                    planet.Uncommons = key.1 as! Int
                case "RareItemsDetected":
                    planet.Rares = key.1 as! Int
                case "LegendaryItemsDetected":
                    planet.Legendaries = key.1 as! Int
                default:
                    break
                }
            }
            planetList.append(planet)
        }
        
        // foreach is readonly.. so use old-fashoined for
        var bestPlanet = planetList[0] // Init with some data
        for i in 0 ... planetList.count-1{
            planetList[i].CalculateScore()
            if(planetList[i].Score > bestPlanet.Score){
                bestPlanet = planetList[i]
            }
        }
        
        return bestPlanet.Name
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 7"