//
//  ViewController.swift
//  Covid_Requirements
//
//  Created by Paritosh Arora on 24/04/21.
//

import UIKit
import SwifteriOS
class ViewController: UIViewController {

   
    let swifter = Swifter(consumerKey:API_KEY,consumerSecret:API_SECRET)
    
    @IBOutlet weak var cityLbl: UITextField!
    @IBOutlet weak var optionBtn: UIButton!
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func optionBtnClicked(_ sender: UIButton) {
        swifter.searchTweet(using: "oxygen cylinder available \(cityLbl.text!)",lang:"en",count:20, success:{(results,metadata)in print(results) }){
            (error) in print("There was a error \(error)")
        }
    }
    
    @IBAction func vaccineBtn(_ sender: UIButton) {
        swifter.searchTweet(using: "vaccines available \(cityLbl.text!)",lang:"en",count:20, success:{(results,metadata)in print(results) }){
            (error) in print("There was a error \(error)")
        }
    }
    @IBAction func bedsBtn(_ sender: UIButton) {
        swifter.searchTweet(using: "icu rooms available \(cityLbl.text!)",lang:"en",count:20, success:{(results,metadata)in print(results) }){
            (error) in print("There was a error \(error)")
        }
    }
  
}

