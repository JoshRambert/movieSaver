//
//  ActionViewController.swift
//  FinalProject
//
//  Created by Joshua  Rambert on 12/28/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit
import CoreData

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
        
        saveGesture(indexPath)
        
        return cell
    }
    //MARK: Properties
    @IBOutlet private weak var movieListTable: UITableView!
    
    @IBAction func saveGesture(_ sender: Any){
        //Create the alerts for when the gesture is used
        let alert = UIAlertController(title: "Would you like to add this movie to your top 10?", message: nil, preferredStyle: .actionSheet)
        
        //create the actions for the saveGesture
        let saveAction = UIAlertAction(title: "Yes", style: .default){
            (alert: UIAlertAction!) -> Void in self.saveInfo()
        }
        
        //create the action that cancels the save gesture
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        //add the actino to the alert view Controller
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    //create the function that wills ave the selected movie
    func saveInfo(){
        //Create the persistent store container
        let persistentContainer = NSPersistentContainer(name: "MovieCoreData")
        persistentContainer.loadPersistentStores(completionHandler:{ (storeDescription, error) in
            //Executed after the stores are loaded
            guard error == nil else {
                fatalError("Couldnt load persistent store container \(error!.localizedDescription)")
            }
            //Merge the view
            persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
            //get the background context
            let context = persistentContainer.newBackgroundContext()
            context.perform {
                //Create the fetch request for the count
                let fetchRequest: NSFetchRequest<MovieInfo> = MovieInfo.fetchRequest()
                
                //execute the count request
                let count: Int
                do{
                    count = try context.count(for: fetchRequest)
                }
                catch let error{
                    fatalError("Error getting amount of MovieInfo \(error.localizedDescription)")
                }
                //If the count is less than 10 insert the data
                guard count < 10 else{
                    return
                }
                //add the contents of the MovieCell into the CoreData stack
                let movieInfo = MovieInfo(context: context)
                
                movieInfo.title = ActionCell.shared.titleLabel?.text
                movieInfo.descrip = ActionCell.shared.hiddenDescription?.text
            }
        })
    }
}
