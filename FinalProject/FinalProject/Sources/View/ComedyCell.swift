//
//  ComedyCell.swift
//  FinalProject
//
//  Created by Joshua  Rambert on 12/30/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ComedyCell: UITableViewCell {
    func getImage(forImageName imageName: String){
        movieImage?.image = UIImage(named: imageName)
    }
    func getTitle(forTitleName titleName: String){
        titleLabel?.text = titleName
    }
    func getDescription(forDescription description: String){
        hiddenDescription?.text = description
    }
    
    //MARK Properties
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var hiddenDescription: UILabel!
    @IBOutlet public weak var movieImage: UIImageView!
}
