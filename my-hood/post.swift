//
//  post.swift
//  my-hood
//
//  Created by Pat Butler on 2015-11-10.
//  Copyright © 2015 RPG Ventures. All rights reserved.
//

import Foundation


class Post: NSObject, NSCoding {
    
    private var _imagePath: String!
    private var _title: String!
    private var _postDescription: String!
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDescription: String {
        return _postDescription
    }
    init(imagePath: String, title: String, postDescription: String) {
     
        self._imagePath = imagePath
        self._title = title
        self._postDescription = postDescription
        
    }
    
    override init() {

    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDescription = aDecoder.decodeObjectForKey("description") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._postDescription, forKey: "description")
        aCoder.encodeObject(self._title, forKey: "title")
    }
}