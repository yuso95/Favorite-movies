//
//  MovieDetailVCViewController.swift
//  FavMovie_NSUserDefault
//
//  Created by Younoussa Ousmane Abdou on 6/30/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class MovieDetailVCViewController: UIViewController {
    
    var movieObj: Movie?
    
    @IBOutlet weak var detailMovieImage: UIImageView!
    @IBOutlet weak var detailMovieTitle: UILabel!
    @IBOutlet weak var detailMovieDesc: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let safeMovieObj = movieObj {
            
            navigationItem.title = safeMovieObj.title
            detailMovieTitle.text = safeMovieObj.title
            detailMovieDesc.text = safeMovieObj.desc
            detailMovieImage.image = safeMovieObj.image
        }
    }

}
