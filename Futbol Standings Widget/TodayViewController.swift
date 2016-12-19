//
//  TodayViewController.swift
//  Futbol Standings Widget
//
//  Created by Dilj on 11/14/16.
//  Copyright © 2016 Dilj. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UITableViewController, NCWidgetProviding{
    
    static var bplLeagueStanding = NSDictionary()

    var organizedData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        self.preferredContentSize = CGSize(width: 0, height: 200)
        
        var data = TodayViewController.bplLeagueStanding
        
        var dataSorted = data.description.components(separatedBy: "},")
        
        organizedData = dataSorted
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "widgetCell") as! CustomWidgetTableViewCell
        
        //Team Name
        var teamName1 = organizedData[indexPath.item].components(separatedBy: "teamName = ").last
        
        var teamName2 = teamName1?.components(separatedBy: "\";\n").first
        
        var teamName3 = teamName2?.replacingOccurrences(of: "\"", with: "")
        
        cell.teamName.text = teamName3
        
        
        //Team Points
        var teamPoints1 = organizedData[indexPath.item].components(separatedBy: "points = ").last
        
        var teamPoints2 = teamPoints1?.components(separatedBy: ";\n").first
        
        cell.teamPoints.text = teamPoints2
        
        //Team Logo
        if UIImage(named: teamName3!) != nil{
            
            cell.teamLogo.image = UIImage(named: teamName3!)
        }
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodayViewController.bplLeagueStanding.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
      
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        //completionHandler(NCUpdateResult.newData)
    }
    
}
