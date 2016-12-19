//
//  BPLViewController.swift
//  Futbol Standings
//
//  Created by Dilj on 11/12/16.
//  Copyright © 2016 Dilj. All rights reserved.
//

import UIKit
import Foundation

class BPLViewController: UITableViewController {
    
    static var bplLeagueStanding = NSDictionary()
    
    var organizedData = [String]()
    
    var teamNames = [String]()
    
    var test = ["hi", "hello"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var data = BPLViewController.bplLeagueStanding
        
        var dataSorted = data.description.components(separatedBy: "},")
        
        organizedData = dataSorted
        /*
        let image = NSURL(string: "http://upload.wikimedia.org/wikipedia/de/0/0a/FC_Liverpool.svg")
        let imagedownload = NSData(contentsOf: image as! URL)
        let imagefile = UIImage(data: imagedownload as! Data)
        print(image?.description)
        print(test5)
        */
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        //Team Name
        var teamName1 = organizedData[indexPath.item].components(separatedBy: "teamName = ").last

        var teamName2 = teamName1?.components(separatedBy: "\";\n").first
        
        var teamName3 = teamName2?.replacingOccurrences(of: "\"", with: "")
        
        cell.teamName.font = UIFont(name: "HelveticaNeue-UltraLight", size: 25)
        
        cell.teamName.text = teamName3
        
        
        //Team Points
        var teamPoints1 = organizedData[indexPath.item].components(separatedBy: "points = ").last
        
        var teamPoints2 = teamPoints1?.components(separatedBy: ";\n").first
        
        cell.numberOfPoints.font = UIFont(name: "HelveticaNeue-UltraLight", size: 25)
        
        cell.numberOfPoints.text = teamPoints2
        
        //Team Logo
        if UIImage(named: teamName3!) != nil{
        
            cell.teamLogo.image = UIImage(named: teamName3!)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizedData.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        tableView.sectionIndexColor = UIColor.black
        
        return 1
    }
  
}
