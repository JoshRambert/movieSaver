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
    
    //MARK Propeerties
    @IBOutlet private weak var movieListTable: UITableView!
    
    @IBAction func saveGesture(_ sender: Any){
        let alert = UIAlertController(title: "Would you like to add this movie to your top 10?", message: nil, preferredStyle: .actionSheet)
        
        //create the actions for the saveGesture
        let saveAction = UIAlertAction(title: "Yes", style: .default){
            (alert: UIAlertAction!) -> Void in self.saveInfo()
        }
        
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveInfo(){
        //Create the persistent store container
        let persistentContainer = NSPersistentContainer(name: "MovieCoreData")
        persistentContainer.loadPersistentStores(completionHandler: {(storeDescription, error) in
            //Executed after the stores are loaded
            guard error == nil else{
                fatalError("Couldnt load persistent store container \(error!.localizedDescription)")
            }
            //merge the view
            persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
            //get the background context
            let context = persistentContainer.newBackgroundContext()
            context.perform{
                //Create the fetch request for the count
                let fetchRequest: NSFetchRequest<MovieInfo> = MovieInfo.fetchRequest()
                
                //the count request
                let count: Int
                do {
                    count = try context.count(for: fetchRequest)
                }
                catch let error{
                    fatalError("Error getting amount of MovieInfo \(error.localizedDescription)")
                }
                //If the count is less than ten add the data to the Core Data stack
                guard count < 10 else{
                    return
                }
                //add the contents of the movieCell into the core Data stack
                let movieInfo = MovieInfo(context: context)
                
                movieInfo.title = SportsCell.shared.titleLabel?.text
                movieInfo.descrip = SportsCell.shared.hiddenDescription?.text
            }
        })
    }
}

