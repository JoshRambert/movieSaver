//
//  ActionViewController.swift
//  FinalProject
//
//  Created by Joshua  Rambert on 12/28/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit

class ActionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    //Setup everything the same as the MainPage view controller except it will display the action films instead
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieService.shared.actionMovieData().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActionCell") as! ActionCell
        let actionValues = MovieService.shared.actionMovieData()[indexPath.row]
        
        let titleName = actionValues.title
        let imageName = actionValues.image
        let description = actionValues.description
        
        cell.getImage(forImageName: imageName)
        cell.getTitle(forTitleName: titleName)
        cell.getDescription(forDescription: description)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let descriptionPageViewController = storyBoard.instantiateViewController(withIdentifier: "DescriptionPage") as! DescriptionPageViewController
        
        //get a refernce to the movieListTale and the cells within them
        let movieCell = movieListTable.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! MovieCell
        
        //assign the values of the movie to the empty labels of the description page
        descriptionPageViewController.getTitle = movieCell.titleLabel.text!
        descriptionPageViewController.getDescription = movieCell.hiddenDescription.text!
        descriptionPageViewController.getImage = movieCell.movieImage.image!
    }
    
    @IBOutlet private weak var movieListTable: UITableView!
}
