//
//  LibraryPage.swift
//  FinalProject
//
//  Created by Joshua Rambert  on 11/12/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit
import CoreData

class LibraryPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Call the functions for the table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfoFetcheResultsController.sections?.first?.numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryCell", for: indexPath)
        
        let movieInfo = movieInfoFetcheResultsController.object(at: indexPath)
        cell.textLabel?.text = movieInfo.title
        cell.detailTextLabel?.text = movieInfo.descrip
        
        return cell 
    }
    
    @IBOutlet private weak var libraryTable: UITableView!
    private var movieInfoFetcheResultsController: NSFetchedResultsController<MovieInfo>!
}
