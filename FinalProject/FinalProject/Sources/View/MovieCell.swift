//
//  MovieCell.swift
//  FinalProject
//
//  Created by Joshua Rambert  on 11/16/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MovieCell: UITableViewCell {
    
    //Create the function that will get the image from the plis data file then call this function in the
    func getImage(forImageName imageName: String){
        movieImage?.image = UIImage(named: imageName)
    }
    func getTitle(forTitleName titleName: String) {
        titleLabel?.text = titleName
    }
    func getDescription(forDescription description: String){
        hiddenDescription?.text = description
    }
    
    //MARK: Create a funciton that will take the information in the cell and add it to the CoreDataModel it will be named save
    func saveInfo(atIndexPath indexPath: IndexPath){
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
                //create the fetch request that will be used to get he count of course instances in CoreData
                let fetchRequest: NSFetchRequest<MovieInfo> = MovieInfo.fetchRequest()
                
                //execute the count request
                let count: Int
                do {
                    count = try context.count(for: fetchRequest)
                }
                catch let error{
                    fatalError("Error getting amount of MovieInfo \(error.localizedDescription)")
                }
                //If the count is 0 insert the data.
                guard count == 0 else{
                    return
                }
                //add the contents of the MovieCell into the Core Data stack
                let movieInfo = MovieInfo(context: context)
                
                //set the movie stuff from the movieCell stuff
                movieInfo.title = self.titleLabel?.text
                movieInfo.descrip = self.hiddenDescription?.text
                //movieInfo.image = self.movieImage!.image
            }
        })
    }
    
    //Properties
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var hiddenDescription: UILabel!
    @IBOutlet public weak var movieImage: UIImageView!
    
    
}
