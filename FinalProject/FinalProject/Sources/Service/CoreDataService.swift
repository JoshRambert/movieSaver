//
//  CoreDataService.swift
//  FinalProject
//
//  Created by Joshua  Rambert on 1/14/18.
//  Copyright © 2018 Joshua Rambert . All rights reserved.
//

import Foundation
import CoreData

class CoreDataService {
    //Create the Fetch requests for the the titles and description of the shit
    private func createFetchResultsController<T>(for fetchRequest: NSFetchRequest<T>) -> NSFetchedResultsController<T> {
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try fetchedResultsController.performFetch()
        }
        catch let error{
            fatalError("Could not get the stuff for whatever reason \(error)")
        }
        return fetchedResultsController
    }
    
    private let persistentContainer: NSPersistentContainer
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "MovieCoreData")
    }
    
    //Create the functions that will get the title and the description from the CoreData file
    
}
