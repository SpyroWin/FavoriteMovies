//
//  Movie+CoreDataProperties.swift
//  FavoriteMovies
//
//  Created by spyrowin on 6/19/16.
//  Copyright © 2016 htainmyoaung. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var image: NSData?
    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var movieURL: String?
    @NSManaged var plot: String?
    @NSManaged var tagBtn: NSNumber?

}
