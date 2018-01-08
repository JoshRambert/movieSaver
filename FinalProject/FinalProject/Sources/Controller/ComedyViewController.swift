//
//  ComedyViewController.swift
//  FinalProject
//
//  Created by Joshua  Rambert on 12/30/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit
import CoreData

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
        
        saveGesture(indexPath)
        
        return cell
    }
    
    //MARK Properties
    @IBOutlet private weak var movieListTable: UITableView!
    
    @IBAction func saveGesture(_ sender: Any){
        //Create the alerts for when the gesture is used
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
            guard error == nil else {
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
                //add the contents of the movieCell into the CoreData stack
                let movieInfo = MovieInfo(context: context)
                
                movieInfo.title = ComedyCell.shared.titleLabel?.text
                movieInfo.descrip = ComedyCell.shared.hiddenDescription?.text
            }
        })
    }
}
