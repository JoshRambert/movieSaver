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
    
    @IBOutlet private weak var movieListTable: UITableView!
}
