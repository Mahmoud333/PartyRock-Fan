//
//  ViewController.swift
//  PartyRock Fan (Udemy)
//
//  Created by Mahmoud Hamad on 11/9/16.
//  Copyright © 2016 Mahmoud SMGL. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // data stored in some type of an array 
    // we need: 
    // 1- url for the youtube video
    // 2- a title for the cell
    // 3- image url for the image
    // we can make 3 arrays for the 3 of them but this is not a good way to manage data so we will make a model class
    // now we can make an array
    
    var partyRocks = [PartyRock]()
    
    var partyRocksF12 = [PartyRock]()
    var partyRocks675LT = [PartyRock]()
    var partyRockMurciSV = [PartyRock]()
    // we will hard code data in the array 
    
    //load iframe in webview bec. webview can render html, css extra javascript
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create instance of a class to create an object
        // we will create the data here
        let p1 = PartyRock(
            imageURL: "https://i.ytimg.com/vi/rio_njlDohg/hqdefault.jpg?custom=true&w=260&h=146&stc=true&jpg444=true&pt=325&jpgq=90&sp=68&sigh=DFK4MADZKfUYLGcAJ9MjYXkOUY8",
            videoURL: "<iframe width=\"\(view.bounds.width*0.9)\" height=\"205\" src=\"https://www.youtube.com/embed/rio_njlDohg\" frameborder=\"0\" allowfullscreen></iframe>",
            videoTitle: "Living with a Ferrari F12 Berlinetta | Ferrari F12 Review"
        ) //335,205
        let p2 = PartyRock(
            imageURL: "https://i.ytimg.com/vi/U_ed8pBMel4/hqdefault.jpg?custom=true&w=260&h=146&stc=true&jpg444=true&pt=325&jpgq=90&sp=68&sigh=5wC7RUSSvDqgSbt01kcmpQepWMs",
            videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/U_ed8pBMel4\" frameborder=\"0\" allowfullscreen></iframe>",
            videoTitle: "Ferrari F12 review - Top Gear - Series 20 - BBC "
        )
        let p3 = PartyRock(
            imageURL: "https://i.ytimg.com/vi/cjp1xjOzJqY/hqdefault.jpg?custom=true&w=260&h=146&stc=true&jpg444=true&pt=325&jpgq=90&sp=68&sigh=UsgM4qdSQhEuAgBdZBi0eTHPYEA",
            videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/cjp1xjOzJqY\" frameborder=\"0\" allowfullscreen></iframe>",
            videoTitle: "Killing Tires With a Ferrari F12 -- /CHRIS HARRIS ON CARS "
        )
        let p4 = PartyRock(
            imageURL: "https://i.ytimg.com/vi/pq5iZCweTws/hqdefault.jpg?custom=true&w=260&h=146&stc=true&jpg444=true&pt=325&jpgq=90&sp=68&sigh=HPkmVadqFaHBDb-hEr5JRTreNj0",
            videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/pq5iZCweTws\" frameborder=\"0\" allowfullscreen></iframe>",
            videoTitle: "Ferrari F12 Berlinetta 2015 فيراري اف12 "
        )
        let p5 = PartyRock(
            imageURL: "https://i.ytimg.com/vi/ihQDd1CqFBw/hqdefault.jpg?custom=true&w=260&h=146&stc=true&jpg444=true&pt=325&jpgq=90&sp=68&sigh=3DH41pFtyfmsLkOKmm09pCCWswU",
            videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ihQDd1CqFBw\" frameborder=\"0\" allowfullscreen></iframe>",
            videoTitle: "Ferrari F12 Berlinetta: Last Of The Naturally Aspirated V12s? - CARFECTION"
        )
        partyRocksF12.append(p1)
        partyRocksF12.append(p2)
        partyRocksF12.append(p3)
        partyRocksF12.append(p4)
        partyRocksF12.append(p5)
        
        let lt1 = PartyRock(
            imageURL: "https://i.ytimg.com/vi/Grb9L08TCdU/hqdefault.jpg?custom=true&w=260&h=146&stc=true&jpg444=true&pt=325&jpgq=90&sp=68&sigh=5c4x01GtYW9an2wRYUY_hmjEnF0",
            videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Grb9L08TCdU\" frameborder=\"0\" allowfullscreen></iframe>",
            videoTitle: "2016 McLaren 675LT: What Happens When You Crank a Supercar Up to 11? - Ignition Ep. 148"
        )
        let lt2 = PartyRock(
            imageURL: "https://i.ytimg.com/vi/SD_VBwMCxVs/hqdefault.jpg?custom=true&w=260&h=146&stc=true&jpg444=true&pt=325&jpgq=90&sp=68&sigh=krQy_nhNoN8FcHHDw0fMLNV-dKE",
            videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SD_VBwMCxVs\" frameborder=\"0\" allowfullscreen></iframe>",
            videoTitle: "NEW CAR! McLaren 675LT Collection Day! "
        )
        partyRocks675LT.append(lt1)
        partyRocks675LT.append(lt2)
        
        let urlTest = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/rio_njlDohg\" frameborder=\"0\" allowfullscreen></iframe>"

        tableView.delegate = self
        tableView.dataSource = self
        
        partyRocks = partyRocksF12
    
    }

    // we will implement the required methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell { // give us a reusable cell
            
            // grab the item out of the array using the indexPath.row and sending it
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock) // update the cell with new data every single time
            
            return cell
        
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return partyRocks.count
    }
    // When i Press on row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                
                destination.partyRock = party
            }
        }
    }
    
    @IBAction func FerrariF12(_ sender: UIButton) {//press -> change displayed array -> reload
        partyRocks = partyRocksF12
        tableView.reloadData()
    }
    @IBAction func McLaren675LT(_ sender: UIButton) {
        partyRocks = partyRocks675LT
        tableView.reloadData()
    }

}

