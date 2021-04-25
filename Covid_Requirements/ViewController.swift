//
//  ViewController.swift
//  Covid_Requirements
//
//  Created by Paritosh Arora on 24/04/21.
//

import UIKit
import SwifteriOS
class ViewController: UIViewController {

    var result:Results?
    var flagR=0
    let swifter = Swifter(consumerKey:API_KEY,consumerSecret:API_SECRET)
    
    @IBOutlet weak var cityLbl: UITextField!
    @IBOutlet weak var optionBtn: UIButton!
    override func viewDidLoad() {
       
        super.viewDidLoad()
        swifter.searchTweet(using: "Covid India",lang:"en",count:20,tweetMode: .extended, success:{(results,metadata)in
            if let tweet=results[0]["full_text"].string{
                print(tweet)
            }
//            print(results)
        }){
            (error) in print("There was a error \(error)")
          
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func optionBtnClicked(_ sender: UIButton) {
        swifter.searchTweet(using: "oxygen cylinder available \(cityLbl.text!)",lang:"en",count:20,tweetMode: .extended, success:{(results,metadata)in print(results) }){
            (error) in print("There was a error \(error)")
        }
    }
    
    @IBAction func vaccineBtn(_ sender: UIButton) {
        swifter.searchTweet(using: "vaccines available \(cityLbl.text!)",lang:"en",count:20,tweetMode: .extended, success:{(results,metadata)in
            if let tweet=results[0]["full_text"].string{
                print(tweet)
            }
//            print(results)
        }){
            (error) in print("There was a error \(error)")
          
        }
    }
    @IBAction func bedsBtn(_ sender: UIButton) {
        swifter.searchTweet(using: "icu rooms available \(cityLbl.text!)",lang:"en",count:20,tweetMode: .extended, success:{(results,metadata)in print(results) }){
            (error) in print("There was a error \(error)")
        }
    }
  
}

struct Results:Codable{
    let data:[ResultItem]
}
struct ResultItem:Codable{
    let text:String
}
