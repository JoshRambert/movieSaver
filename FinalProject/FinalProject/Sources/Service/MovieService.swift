//
//  MovieService.swift
//  FinalProject
//
//  Created by Joshua Rambert  on 11/11/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit

class MovieService {
    //Create the Functions that will be used to get the Title and Image from the Movies
    func horrorMovieInfo() -> Array<(title: String, image:String)> {
        var movie = Array<(String, String)>()
        for movieValues in horrorData {
            let info = movieValues["MovieInfo"]
            let title = info!["MovieTitle"] as! String
            let image = info!["ImageName"] as! String
            
            movie.append((title, image))
            
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
