//
//  MovieDetailVC.swift
//  FavoriteMovies
//
//  Created by spyrowin on 6/19/16.
//  Copyright © 2016 htainmyoaung. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {

    //Variables
    var movieLink:String!
    var movie: Movie!
    
    //Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var plotLbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        titleLbl.text = movie.title
        descLbl.text = movie.desc
        plotLbl.text = movie.plot
        movieLink = movie.movieURL
        img.image = movie.getMovieImg()
    }
    
    @IBAction func backBtnTapped(sender: AnyObject){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func movieLinkTapped(sender: AnyObject){
        performSegueWithIdentifier("goToWeb", sender: movieLink)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToWeb" {
            if let webVC = segue.destinationViewController as? WebVC {
                if let str = sender as? String{
                    webVC.webURL = str
                }
                webVC.hideBookMark = true
            }
        }
    }

}
