//
//  ViewController.swift
//  Covid_Requirements
//
//  Created by Paritosh Arora on 24/04/21.
//

import UIKit
import SwifteriOS
class ViewController: UIViewController {
    var resultArr=[String]()
    var uriArr=[String]()
    var result:Results?
    var buttonTapped=false
    var flagR=0
    let swifter = Swifter(consumerKey:Constants.API_KEY,consumerSecret:Constants.API_SECRET)
    @IBOutlet weak var content: UITableView!
    @IBOutlet weak var cityLbl: UITextField!
    @IBOutlet weak var optionBtn: UIButton!
    @IBOutlet weak var bedBtn: UIButton!
    @IBOutlet weak var vaccineBtn: UIButton!
    override func viewDidLoad() {
        if let path = Bundle.main.path(forResource: "keys", ofType: "plist"){
            
        }
        content.delegate=self
        content.dataSource=self
        super.viewDidLoad()
        swifter.searchTweet(using: "Covid India",lang:"en",count:20,tweetMode: .extended, success:{(results,metadata)in
            self.resultArr.removeAll()
            self.uriArr.removeAll()
            for i in (0...19){
                self.resultArr.append(results[i]["full_text"].string ?? "no result")
                self.uriArr.append(results[i]["id_str"].string ?? " ")
            }
            if let tweet=results[0]["full_text"].string{
                self.content.reloadData()
               
//                print(tweet)
            }
//            print(results)
        }){
            (error) in print("There was a error \(error)")
          
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func optionBtnClicked(_ sender: UIButton) {
       
            optionBtn.backgroundColor=UIColor.cyan
            optionBtn.layer.cornerRadius=15
            bedBtn.backgroundColor=UIColor.clear
            vaccineBtn.backgroundColor=UIColor  .clear
                    
       
        
        
        swifter.searchTweet(using: "oxygen cylinder available \(cityLbl.text!)",lang:"en",count:20,tweetMode: .extended, success:{(results,metadata)in
            self.resultArr.removeAll()
            self.uriArr.removeAll()
            for i in (0...19){
                self.resultArr.append(results[i]["full_text"].string ?? "no result")
                self.uriArr.append(results[i]["id_str"].string ?? " ")
            }
            if let tweet=results[0]["full_text"].string{
                self.content.reloadData()
               
//                print(tweet)
            }
        }){
            (error) in print("There was a error \(error)")
            
        }
    }
    
    @IBAction func vaccineBtn(_ sender: UIButton) {
        vaccineBtn.backgroundColor=UIColor.cyan
        vaccineBtn.layer.cornerRadius=15
        bedBtn.backgroundColor=UIColor.clear
        optionBtn.backgroundColor=UIColor  .clear
        swifter.searchTweet(using: "vaccines available \(cityLbl.text!)",lang:"en",count:20,tweetMode: .extended, success:{(results,metadata)in
            self.resultArr.removeAll()
            self.uriArr.removeAll()
            for i in (0...19){
                self.resultArr.append(results[i]["full_text"].string ?? "no result")
                self.uriArr.append(results[i]["id_str"].string ?? " ")
            }
            if let tweet=results[0]["full_text"].string{
                self.content.reloadData()
               
//                print(tweet)
            }
//            print(results)
        }){
            (error) in print("There was a error \(error)")
          
        }
    }
    @IBAction func bedsBtn(_ sender: UIButton) {
        bedBtn.backgroundColor=UIColor.cyan
        bedBtn.layer.cornerRadius=15
        optionBtn.backgroundColor=UIColor.clear
        vaccineBtn.backgroundColor=UIColor  .clear
        swifter.searchTweet(using: "icu rooms available \(cityLbl.text!)",lang:"en",count:20,tweetMode: .extended, success:{(results,metadata)in
            self.resultArr.removeAll()
            self.uriArr.removeAll()
            for i in (0...19){
                self.resultArr.append(results[i]["full_text"].string ?? "no result")
                self.uriArr.append(results[i]["id_str"].string ?? " ")
            }
            if let tweet=results[0]["full_text"].string{
                self.content.reloadData()
               
//                print(tweet)
            }
        }){
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
//MARK: Interaction of cells
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let baseUrl="https://twitter.com/i/web/status/"
        if let url = URL(string: "\(baseUrl)"+uriArr[indexPath.row]) {
            UIApplication.shared.open(url)
        }
    }
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArr.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=content.dequeueReusableCell(withIdentifier: "cell",for:indexPath)
        print(resultArr)
        cell.textLabel?.text=resultArr[indexPath.row]
        return cell
    }
}
