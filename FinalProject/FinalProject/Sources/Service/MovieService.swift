//
//  MovieService.swift
//  FinalProject
//
//  Created by Joshua Rambert  on 11/11/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit

//Change the dictionaries in the plists to arrays of string that hold the titile the image and the description -- then add an index to each of the functions.
class MovieService {
    //Create the Functions that will be used to get the Title and Image from the Movies
    func horrorMovieData() -> Array<(title: String, image: String, description: String)> {
        
        //create an array for the Stuff
        var movie = Array<(String, String, String)>()
        //parse the data from the plist
        for movieValues in horrorData {
            
            
            //add it to the movie array
            movie.append((title, image, description))
            
        }
        //return the movie Array
        return movie
    }
    
    //Repeat the process over and over again for each of the plists
    func actionMovieData() -> Array<(title: String, image: String, description: String)> {
        var movie = Array<(String, String, String)>()
        for movieValues in actionData {
            let description = movieValues["Description"] as! String
            let info = movieValues["MovieInfo"] as! Array<String>
            let title = info[0]
            let image = info[1]
            movie.append((title, image, description))
        }
        return movie
    }
    
    func comedyMovieData() -> Array<(title: String, image: String, description: String)> {
        var movie = Array<(String, String, String)>()
        for movieValues in comedyData {
            let description = movieValues["Description"] as! String
            let info = movieValues["MovieInfo"] as! Array<String>
            let title = info[0]
            let image = info[1]
            movie.append((title, image, description))
        }
        return movie
    }
    
   func sportsMovieData() -> Array<(title: String, image: String, description: String)> {
        var movie = Array<(String, String, String)>()
        for movieValues in sportsData {
            let description = movieValues["Description"] as! String
            let info = movieValues["MovieInfo"] as! Array<String>
            let title = info[0]
            let image = info[1]
            movie.append((title, image, description))
        }
        return movie
    }
    
    //create the initilizer and the private properties
    private init() {
        //Initialize all of the properties
        let horrorDataPath =  Bundle.main.path(forResource: "HorrorMovieData", ofType: "plist")!
        horrorData = NSArray(contentsOfFile: horrorDataPath) as! Array<Dictionary<String, AnyObject>>
        
        let actionDataPath = Bundle.main.path(forResource: "ActionMovieData", ofType: "plist")!
        actionData = NSArray(contentsOfFile: actionDataPath) as! Array<Dictionary<String, AnyObject>>
        
        let comedyDataPath = Bundle.main.path(forResource: "ComedyMovieData", ofType: "plist")!
        comedyData = NSArray(contentsOfFile: comedyDataPath) as! Array<Dictionary<String, AnyObject>>
        
        let sportsDataPath = Bundle.main.path(forResource: "SportsMovieData", ofType: "plist")!
        sportsData = NSArray(contentsOfFile: sportsDataPath) as! Array<Dictionary<String, AnyObject>>
    }
    
    //MARK: Properties
    private let horrorData: Array<Dictionary<String, AnyObject>>
    private let actionData: Array<Dictionary<String, AnyObject>>
    private let comedyData: Array<Dictionary<String, AnyObject>>
    private let sportsData: Array<Dictionary<String, AnyObject>>
    
    //MARK: Static properties
    static let shared = MovieService()
}

