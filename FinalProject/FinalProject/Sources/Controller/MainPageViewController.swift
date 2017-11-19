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
        return MovieService.shared.sportsMovieData().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Use this Function to display the data onto the table View
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        //access the values from the MovieService class that configured yet
        let horrorValues = MovieService.shared.horrorMovieData()[indexPath.row]
        let actionValues = MovieService.shared.actionMovieData()[indexPath.row]
        let comedyValues = MovieService.shared.comedyMovieData()[indexPath.row]
        let sportsValues = MovieService.shared.sportsMovieData()[indexPath.row]
        
        //Whenever the butotn is clicked that corresponds with the gnere of the movie change the contents of the
        //Cell view
        if horrorButton.isTouchInside {
            cell.textLabel?.text = horrorValues.title
            let imageName = horrorValues.image
            cell.getImage(forImageName: imageName)
            
        } else if actionButton.isTouchInside {
            cell.textLabel?.text = actionValues.title
            let imageName = actionValues.image
            cell.getImage(forImageName: imageName)
        } else if comedyButton.isTouchInside {
            cell.textLabel?.text = comedyValues.title
            let imageName = comedyValues.image
            cell.getImage(forImageName: imageName)
        } else if sportsButton.isTouchInside {
            cell.textLabel?.text = sportsValues.title
            let imageName = sportsValues.image
            cell.getImage(forImageName: imageName)
        }
        return cell
    }
    
    //use a prepare for sugue to send the data from the tableView into the Description page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DescriptionSegue" {
            let descriptionPageViewController = segue.destination as! DescriptionPageViewController
            
            //send te data over to the description page -- and send the data back when it is deselected
        }
    }
    //Create an outlet for the Table in the ViewController
    @IBOutlet private weak var movieListTable: UITableView!
    
    //When each button is clicked it should change the contents of the MovieCell
    @IBOutlet private weak var horrorButton: UIButton!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var comedyButton: UIButton!
    @IBOutlet private weak var sportsButton: UIButton!
}
