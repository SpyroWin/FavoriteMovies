//
//  ViewController.swift
//  FavoriteMovies
//
//  Created by spyrowin on 6/19/16.
//  Copyright © 2016 htainmyoaung. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //variables
    var movies = [Movie]()
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResult()
        tableView.reloadData()
    }
    
    func fetchAndSetResult(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            let result = try context.executeFetchRequest(fetchRequest)
            self.movies = result as! [Movie]
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            let movie = movies[indexPath.row]
            cell.buttonTag(indexPath.row)
            cell.configureCell(movie)
            return cell
        }else{
            return MovieCell()
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MovieDetailVC" {
            if let movieDetailVC = segue.destinationViewController as? MovieDetailVC {
                if let movie = sender as? Movie{
                    movieDetailVC.movie = movie
                }
            }
        }
    }
    
    @IBAction func cellBtnTapped(sender: UIButton!){
        let buttonRow = sender.tag
        let movie = movies[buttonRow]
        performSegueWithIdentifier("MovieDetailVC", sender: movie)
        print(buttonRow)
    }

}

