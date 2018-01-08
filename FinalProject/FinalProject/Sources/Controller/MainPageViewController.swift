//
//  MainPageViewController.swift
//  FinalProject
//
//  Created by Joshua Rambert  on 11/11/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit
import CoreData

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let horrorValues = MovieService.shared.horrorMovieData()[indexPath.row]
        
        let titleName = horrorValues.title
        let imageName = horrorValues.image
        let description = horrorValues.description
        cell.getImage(forImageName: imageName)
        cell.getTitle(forTitleName: titleName)
        cell.getDescription(forDescription: description)
        
        saveGesture(indexPath)
        return cell
    }
    
    //MARK: Outlets and Properties
    @IBOutlet private weak var movieListTable: UITableView!

    @IBAction func saveGesture(_ sender: Any){
        let alert = UIAlertController(title: "Would you like to add this movie to Your Top 10?", message: nil, preferredStyle: .actionSheet)
        
        //create the actions for the saveGesture
        let saveAction = UIAlertAction(title: "Yes", style: .default) {
            (alert: UIAlertAction!) -> Void in self.saveInfo()
        }
        
        //create the action that cancels the save Gesture
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        //add the actions to the alert view controller
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        //forgot to present dumbass
        present(alert, animated: true, completion: nil)
    }
    
    func saveInfo(){
        //create the persistant store container
        let persistentContainer = NSPersistentContainer(name: "MovieCoreData")
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            //Executed after the stores are loaded
            guard error == nil else {
                fatalError("Couldn't load persistent store container \(error!.localizedDescription)")
            }
            //Set the view context to merge from its parents
            persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
            //get the background context
            let context = persistentContainer.newBackgroundContext()
            context.perform {
                //create the fetch request that will be used to get the number of movie Instances
                let fetchRequest: NSFetchRequest<MovieInfo> = MovieInfo.fetchRequest()
                
                //execute the count request
                let count: Int
                do {
                    count = try context.count(for: fetchRequest)
                }
                catch let error{
                    fatalError("Error getting amount of MovieInfo \(error.localizedDescription)")
                }
                //If the count is less than 10 insert the data.
                guard count < 10 else{
                    return
                }
                //add the contents of the MovieCell into the Core Data stack
                let movieInfo = MovieInfo(context: context)
                
                movieInfo.title = MovieCell.shared.titleLabel?.text
                movieInfo.descrip = MovieCell.shared.hiddenDescription?.text
            }
        })
    }}
