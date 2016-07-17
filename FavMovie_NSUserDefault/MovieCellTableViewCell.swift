//
//  MovieCellTableViewCell.swift
//  FavMovie_NSUserDefault
//
//  Created by Younoussa Ousmane Abdou on 6/30/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class MovieCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieCellImage: UIImageView!
    @IBOutlet weak var movieCellTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor.yellowColor()
        
        movieCellImage.layer.cornerRadius = 5.0
        movieCellImage.clipsToBounds = true
    }
    
    func configureCell(movie: Movie) {
        
        movieCellTitle.text = movie.title
        movieDesc.text = movie.desc
        movieCellImage.image = movie.image
        
        // URL WILL BE LATER
    }
}
