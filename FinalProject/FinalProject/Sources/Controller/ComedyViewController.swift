//
//  ComedyViewController.swift
//  FinalProject
//
//  Created by Joshua  Rambert on 12/30/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit

class ComedyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Setup the functions for the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieService.shared.comedyMovieData().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComedyCell") as! ComedyCell
        let comedyValues = MovieService.shared.comedyMovieData()[indexPath.row]
        
        let titleName = comedyValues.title
        let imageName = comedyValues.image
        let description = comedyValues.description
        cell.getImage(forImageName: imageName)
        cell.getTitle(forTitleName: titleName)
        cell.getDescription(forDescription: description)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let descriptionPageViewController = storyBoard.instantiateViewController(withIdentifier: "DescriptionPage") as! DescriptionPageViewController
        
        //Get a reference to the movieListTable and the cells within them
        let movieCell = movieListTable.dequeueReusableCell(withIdentifier: "ComedyCell", for: indexPath) as! ComedyCell
        
        descriptionPageViewController.getTitle = movieCell.titleLabel.text!
        descriptionPageViewController.getDescription = movieCell.hiddenDescription.text!
        descriptionPageViewController.getImage = movieCell.movieImage.image!
    }
    
    //MARK Properties
    @IBOutlet private weak var movieListTable: UITableView!
}
