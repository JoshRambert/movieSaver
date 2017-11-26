//
//  MainPageViewController.swift
//  FinalProject
//
//  Created by Joshua Rambert  on 11/11/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit

class MainPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Setup the functions for the TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        //return the Amount of Data from the MovieService Class
        return MovieService.shared.horrorMovieData().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let horrorValues = MovieService.shared.horrorMovieData()[indexPath.row]
        
        let titleName = horrorValues.title
        let imageName = horrorValues.image
        let description = horrorValues.description
        cell.getImage(forImageName: imageName)
        cell.getTitle(forTitleName: titleName)
        cell.getDescription(forDescription: description)
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBaord = UIStoryboard(name: "Main", bundle: nil)
        let descriptionPageViewController = storyBaord.instantiateViewController(withIdentifier: "DescriptionPage") as! DescriptionPageViewController
        
        //get a refernce to the movieListTable and the cells within them
        let movieCell = movieListTable.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        descriptionPageViewController.getTitle = movieCell.titleLabel!.text
        descriptionPageViewController.getDescription = movieCell.hiddenDescription!.text
        descriptionPageViewController.getImage = movieCell.movieImage!.image
        
        self.navigationController?.pushViewController(descriptionPageViewController, animated: true)
    }
    
    /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DescriptionSegue" {
            let descriptionPageViewController = segue.destination as! DescriptionPageViewController
            let movieCell = movieListTable.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
            
            descriptionPageViewController.getTitle = movieCell.titleLabel!.text
            descriptionPageViewController.getDescription = movieCell.hiddenDescription!.text
            descriptionPageViewController.getImage = movieCell.movieImage!.image
            
            let selectedIndex = movieListTable.indexPathForSelectedRow!
            movieListTable.deselectRow(at: selectedIndex, animated: true)
        }
        else {
            super.prepare(for: segue, sender: sender)
        }
    } */
    
    //MARK: Outlets and Properties
    @IBOutlet private weak var movieListTable: UITableView!
    
    //MARK: Not working
    
}
