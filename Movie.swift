//
//  Movie.swift
//  FavoriteMovies
//
//  Created by spyrowin on 6/19/16.
//  Copyright © 2016 htainmyoaung. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func setMovieImg(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImg() -> UIImage{
        let img = UIImage(data: self.image!)!
        return img
    }

}
