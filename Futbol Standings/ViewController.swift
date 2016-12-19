//
//  ViewController.swift
//  Futbol Standings
//
//  Created by Dilj on 11/10/16.
//  Copyright © 2016 Dilj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let url = URL(string: "http://api.football-data.org/v1/soccerseasons/")!
        
        //adding 426 in url lists by BPL
        let urlBPL = URL(string: "http://api.football-data.org/v1/soccerseasons/426/teams/")!
        */
        
        let url = URL(string: "http://api.football-data.org/v1/soccerseasons/426/leagueTable")!
        //getDataFromSite(url)
        
        var api = "4ff5cb4453164e7b9bcfd7aac62f2d96"
        var headerName = "X-Auth-Token"
        
        downloadData(url, api: api, headerNamed: headerName)
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
                        
                        BPLViewController.bplLeagueStanding = json
                        
                        self.performSegue(withIdentifier: "loaded", sender: self)
                    }
                    
                }catch{
                    
                    print("error in JSONSERIALIZATION")
                    
                }
            }
        })
        
        task.resume()

    
    }
    
    /*
     func getDataFromSite(_ url: URL){
     
     let config = URLSessionConfiguration.default
     let session = URLSession(configuration: config)
     
     let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
     
     if error != nil{
     
     print(error?.localizedDescription)
     }else{
     
     do {
     
     if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary{
     
     var dataFromSite = json as! NSDictionary
     
     BPLViewController.bplLeagueStanding = dataFromSite
     }
     
     }catch{
     
     print("error in JSONSERIALIZATION")
     
     }
     }
     })
     
     task.resume()
     }
     */
    


}
