//
//  AddMovieVC.swift
//  FavoriteMovies
//
//  Created by spyrowin on 6/19/16.
//  Copyright © 2016 htainmyoaung. All rights reserved.
//

import UIKit
import CoreData
import WebKit

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, DataEnteredDelegate {
    
    //variables
    var imagePicker: UIImagePickerController!
    var movieLink: String!

    //Outlets
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBOutlet weak var plotsTxt: UITextField!
    @IBOutlet weak var linkLbl: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        movieLink="http://www.imdb.com/"
    }
    
    func markedWebURL(url: NSString) {
        movieLink = url as String
        linkLbl.text = movieLink
    }
    
    @IBAction func backTabbed(sender: UIButton!){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func movieLinkTabbed(sender: AnyObject){
        performSegueWithIdentifier("goToWeb", sender: movieLink)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToWeb" {
            if let webVC = segue.destinationViewController as? WebVC {
                if let str = sender as? String{
                    webVC.webURL = str
                }
                webVC.delegate = self
                webVC.hideBookMark = false
            }
        }
    }
    
    @IBAction func addImageTabbed(sender: UIButton!){
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }
    
    @IBAction func addMoviePressed(sender: AnyObject){
        if let title = titleTxt.text where title != "" {
            if let desc = descriptionTxt.text, let plots = plotsTxt.text {
                let app = UIApplication.sharedApplication().delegate as! AppDelegate
                let context = app.managedObjectContext
                let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
                let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
                
                movie.title = title
                movie.desc = desc
                movie.plot = plots
                movie.movieURL = movieLink
                
                if let img = movieImg.image {
                    movie.setMovieImg(img)
                }
                
                context.insertObject(movie)
                
                do {
                    try context.save()
                }catch{
                    print("Could not save recipe")
                }
                
                dismissViewControllerAnimated(true, completion: nil)
                
            }
        }
    }

}
