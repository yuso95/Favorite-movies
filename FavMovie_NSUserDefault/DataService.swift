//
//  DataService.swift
//  FavMovie_NSUserDefault
//
//  Created by Younoussa Ousmane Abdou on 7/14/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class DataService {
    
    struct PropretyKey {
        
        static var moviesDataKey = "moviesData"
    }
    
    static var instance = DataService()
    
    private var _loadedMovies = [Movie]()
    
    var loadedMovies: [Movie] {
        
        return _loadedMovies
    }
    
    func addMovie(movie: Movie) {
        
        _loadedMovies.append(movie)
        saveMovies()
        loadMovies()
    }
    
    func saveMovies() {
        
        let moviesData = NSKeyedArchiver.archivedDataWithRootObject(_loadedMovies)
        NSUserDefaults.standardUserDefaults().setObject(moviesData, forKey: PropretyKey.moviesDataKey)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadMovies() {
        
        if let movieData = NSUserDefaults.standardUserDefaults().objectForKey(PropretyKey.moviesDataKey) as? NSData {
            
            if let moviesArray = NSKeyedUnarchiver.unarchiveObjectWithData(movieData) as? [Movie] {
                
                _loadedMovies = moviesArray
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName("MovieLoaded", object: nil)
    }
    
}
