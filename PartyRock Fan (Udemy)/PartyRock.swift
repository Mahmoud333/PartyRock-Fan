//
//  PartyRock.swift
//  PartyRock Fan (Udemy)
//
//  Created by Mahmoud Hamad on 11/12/16.
//  Copyright © 2016 Mahmoud SMGL. All rights reserved.
//

import Foundation

class PartyRock {
    
    fileprivate var _imageURL: String!
    fileprivate var _videoURL: String!
    fileprivate var _videoTitle: String!
    
    
    //will keep the outside classes of manipulating our data which is VERY IMPORTANT
    var imageURL: String {
        return _imageURL
    }
    
    var videoURL: String {
        return _videoURL
    }
    
    var videoTitle: String {
        return _videoTitle
    }
    
    
    // we will initialise them when we set the class
    init(imageURL: String, videoURL: String, videoTitle: String){
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
        
    }
    
    //now we can solve our problem 
    //we have it in PartyCell Arguments
    
    
    
}
