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
    //get the data from the data cells and displat it within the ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text! = getTitle
        movieDescription.text! = getDescription
        movieImage.image = getImage
    }
    
    //MARK: Properties
    var getTitle: String!
    var getImage: UIImage!
    var getDescription: String!
    
    @IBOutlet public weak var movieImage: UIImageView!
    @IBOutlet public weak var movieTitle: UILabel!
    @IBOutlet public weak var movieDescription: UILabel!
}
