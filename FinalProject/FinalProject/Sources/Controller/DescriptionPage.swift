//
//  DescriptionPage.swift
//  FinalProject
//
//  Created by Joshua Rambert  on 11/12/17.
//  Copyright © 2017 Joshua Rambert . All rights reserved.
//

import Foundation
import UIKit

class DescriptionPageViewController: UIViewController{
    //get the data from the data cells and display it within the ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func getMovieInfo() {
        movieTitle.text = getTitle
        movieDescription.text = getDescription
        movieImage.image = getImage
        
    }
    
    //MARK: Properties
    var getTitle = String()
    var getImage = UIImage()
    var getDescription = String()
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
}
