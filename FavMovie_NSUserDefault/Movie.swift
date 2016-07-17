//
//  Movie.swift
//  FavMovie_NSUserDefault
//
//  Created by Younoussa Ousmane Abdou on 6/30/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class Movie: NSObject, NSCoding {
    
    struct PropretyKey {
        
        static var titleKey = "title"
        static var descKey = "desc"
        static var imageKey = "image"
    }
    
    private var _title: String!
    private var _desc: String!
    private var _image: UIImage?
    
    var title: String {
        
        return _title
    }
    
    var desc: String {

        return _desc
    }
    
    var image: UIImage? {
        
        return _image
    }
    
    init(title: String!, desc: String!, image: UIImage?) {
        self._title = title
        self._desc = desc
        self._image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        _title = aDecoder.decodeObjectForKey(PropretyKey.titleKey) as! String
        _desc = aDecoder.decodeObjectForKey(PropretyKey.descKey) as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(_title, forKey: PropretyKey.titleKey)
        aCoder.encodeObject(_desc, forKey: PropretyKey.descKey)
    }
}
