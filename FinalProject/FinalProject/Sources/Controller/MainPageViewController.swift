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
        return MovieService.shared.actionMovieData().count
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
    
    //use a prepare for sugue to send the data from the tableView into the Description page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DescriptionSegue" {
            let descriptionPageViewController = segue.destination as! DescriptionPageViewController
            //send the data over to the description page -- and send the data back when it is deselected

            //Get a reference to the to the movieListTable and the Cells within them -- then send the data
            let movieCell = movieListTable.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
            descriptionPageViewController.getTitle = movieCell.titleLabel!.text
            descriptionPageViewController.getDescription = movieCell.hiddenDescription!.text
            descriptionPageViewController.getImage = movieCell.movieImage!.image
        }
    }
    
    //MARK: Outlets and Properties
    @IBOutlet private weak var movieListTable: UITableView!
    private var genreIndex: IndexPath! = nil
    
    //Create a Function for each of the Buttons and change the contents of the cell whenever the button is clicked
    @IBAction private func horrorButton() {
        //Change the contents that is within the tableView Whenever this button is clicked -- first acess the
        //contents of the cell
        let cell = movieListTable.dequeueReusableCell(withIdentifier: "MovieCell", for: genreIndex) as! MovieCell
        let horrorValues = MovieService.shared.horrorMovieData()[genreIndex.row]
        
        let titleName = horrorValues.title
        let imageName = horrorValues.image
        let description = horrorValues.description
        cell.getImage(forImageName: imageName)
        cell.getTitle(forTitleName: titleName)
        cell.getDescription(forDescription: description)
    }
    
    @IBAction private func comedyButton() {
        //do the same for this actoin button that you did for th one before
        let cell = movieListTable.dequeueReusableCell(withIdentifier: "MovieCell", for: genreIndex) as! MovieCell
        let comedyValues = MovieService.shared.comedyMovieData()[genreIndex.row]
        
        let titleName = comedyValues.title
        let imageName = comedyValues.image
        let description = comedyValues.description
        cell.getImage(forImageName: imageName)
        cell.getTitle(forTitleName: titleName)
        cell.getDescription(forDescription: description)
    }
    
    @IBAction private func actionButton() {
        let cell = movieListTable.dequeueReusableCell(withIdentifier: "MovieCell", for: genreIndex) as! MovieCell
        let actionValues = MovieService.shared.actionMovieData()[genreIndex.row]
        
        let titleName = actionValues.title
        let imageName = actionValues.image
        let description = actionValues.description
        cell.getImage(forImageName: imageName)
        cell.getTitle(forTitleName: titleName)
        cell.getDescription(forDescription: description)
    }
    
    @IBAction private func sportsButton() {
        let cell = movieListTable.dequeueReusableCell(withIdentifier: "MovieCell", for: genreIndex) as! MovieCell
        let sportsValues = MovieService.shared.sportsMovieData()[genreIndex.row]
        
        let titleName = sportsValues.title
        let imageName = sportsValues.image
        let description = sportsValues.description
        cell.getImage(forImageName: imageName)
        cell.getTitle(forTitleName: titleName)
        cell.getDescription(forDescription: description)
    }
}
