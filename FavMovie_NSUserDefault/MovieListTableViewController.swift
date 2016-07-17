//
//  MovieListTableViewController.swift
//  FavMovie_NSUserDefault
//
//  Created by Younoussa Ousmane Abdou on 7/12/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.instance.loadMovies()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(reloadOnMoviesLoaded(_:)), name: "MovieLoaded", object: nil)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return DataService.instance.loadedMovies.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let movieIndex = DataService.instance.loadedMovies[indexPath.row]
        
        let CELLIDENTIFIER = "MovieCell"
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(CELLIDENTIFIER) as? MovieCellTableViewCell {
            
            cell.configureCell(movieIndex)
            
             return cell
        } else {
            
            let cell = MovieCellTableViewCell()
            
            return cell
        }
       
    }
    
    // Reload Data
    
    func reloadOnMoviesLoaded(notif: AnyObject) {
        
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let movieDetailVC = segue.destinationViewController as? MovieDetailVCViewController
        
        if segue.identifier == "GoToDetail" {
            
            let selectedCell = sender as? MovieCellTableViewCell
            let selectedIndexPath = tableView.indexPathForCell(selectedCell!)
            let selectedMovie = DataService.instance.loadedMovies[(selectedIndexPath?.row)!]
            
            movieDetailVC?.movieObj = selectedMovie
        }
    }

}
