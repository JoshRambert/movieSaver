//
//  MovieCell.swift
//  FinalProject
//
//  Created by Joshua Rambert  on 11/16/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UITableViewCell {
    //Create the function that will get the image from the plis data file then call this function in the
    func getImage(forImageName imageName: String){
        movieImage.image = UIImage(named: imageName)
    }
    //Properties
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var hiddenDescription: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
}
