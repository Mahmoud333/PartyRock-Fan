//
//  PartyCell.swift
//  PartyRock Fan (Udemy)
//
//  Created by Mahmoud Hamad on 11/12/16.
//  Copyright © 2016 Mahmoud SMGL. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    // fill this for url for image
    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    // put title in here
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //pass data through this func eveytime new cell was created
    func updateUI(_ partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        //TODO: set image from url
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async { [unowned self] in
            let url: URL = URL(string: partyRock.imageURL)!
            let data: Data = try! Data(contentsOf: url)
            
            DispatchQueue.main.async { [unowned self] in
                self.videoPreviewImage?.image = UIImage(data: data)
            }
        }

        // Swift 3.0
//        let url = URL(string: partyRock.imageURL)!
//        DispatchQueue.global().async { //async background thread
//            do {
//                let data = try Data(contentsOf: url)
//                DispatchQueue.global().sync { //sync is the main thread where user interface can be updated
//                    self.videoPreviewImage.image = UIImage(data: data)
//                }
//            } catch {
//                //handle the error
//            }
//        }
        
        
    }

}
