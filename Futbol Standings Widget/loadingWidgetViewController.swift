//
//  loadingWidgetViewController.swift
//  Futbol Standings
//
//  Created by Dilj on 11/14/16.
//  Copyright © 2016 Dilj. All rights reserved.
//

import UIKit
import NotificationCenter

class loadingWidgetViewController: UIViewController, NCWidgetProviding{

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "http://api.football-data.org/v1/soccerseasons/426/leagueTable")!
        var api = "4ff5cb4453164e7b9bcfd7aac62f2d96"
        var headerName = "X-Auth-Token"
        
        self.preferredContentSize = CGSize(width: 0, height: 200)
        //self.extensionContext?.widgetLargestAvailableDisplayMode = NCWidgetDisplayMode.expanded
        downloadData(url, api: api, headerNamed: headerName)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("loaded")
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize){
        
        /*
        if (activeDisplayMode == NCWidgetDisplayMode.compact) {
            self.preferredContentSize = maxSize;
            
            print(maxSize)
        }
        else {
            self.preferredContentSize = CGSize(width: 0, height: 200);
        }
        */
    }
    
    func downloadData(_ url: URL, api: String, headerNamed: String){
        var config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [headerNamed:api]
        
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil{
                
                print(error?.localizedDescription)
            }else{
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary{
                        
                        TodayViewController.bplLeagueStanding = json
                        
                        self.performSegue(withIdentifier: "widgetLoaded", sender: self)

                    }
                    
                }catch{
                    
                    print("error in JSONSERIALIZATION")
                    
                }
            }
        })
        
        task.resume()
        
        
    }

}
