//
//  SportsViewController.swift
//  FinalProject
//
//  Created by Joshua  Rambert on 12/30/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SportsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieService.shared.sportsMovieData().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportsCell") as! SportsCell
        let sportsValues = MovieService.shared.sportsMovieData()[indexPath.row]
        
        let titleName = sportsValues.title
        let imageName = sportsValues.image
        let description = sportsValues.description
        cell.getImage(forImageName: imageName)
        cell.getTitle(forTitleName: titleName)
        cell.getDescription(forDescription: description)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let descriptionPageViewController = storyBoard.instantiateViewController(withIdentifier: "DescriptionPage") as! DescriptionPageViewController
        
        //get a reference to the movieListTable from the MainStoryBoard
        let movieCell = movieListTable.dequeueReusableCell(withIdentifier: "SportsCell", for: indexPath) as! SportsCell
        
        descriptionPageViewController.getTitle = movieCell.titleLabel.text!
        descriptionPageViewController.getDescription = movieCell.hiddenDescription.text!
        descriptionPageViewController.getImage = movieCell.movieImage.image!
    }
    
    //MARK Propeerties
    @IBOutlet private weak var movieListTable: UITableView!
}

