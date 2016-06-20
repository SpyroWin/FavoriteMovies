//
//  MovieCell.swift
//  FavoriteMovies
//
//  Created by spyrowin on 6/19/16.
//  Copyright © 2016 htainmyoaung. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func buttonTag(tag: Int){
        movieBtn.tag = tag
    }
    
    func configureCell(movie: Movie) {
        movieImg.image = movie.getMovieImg()
        movieTitle.text = movie.title
    }

}
