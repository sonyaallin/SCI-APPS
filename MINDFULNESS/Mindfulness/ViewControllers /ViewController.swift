//
//  ViewController.swift
//  Mindfulness
//
//  Created by Abdullah Khokhar & Rahul Jasani on 2022-02-14.
//

import UIKit
import Firebase
import iCarousel
import FirebaseAuth

class ViewController: UIViewController, iCarouselDataSource {
    
    @IBOutlet weak var nameLabel: UILabel!
    var titleOfPage = ""
    var labelOfTitle = ""
    var categoryChosen = "situations"
    var labelsForSituations:[String] = ["Commute", "Busy Day"]
    var labelsForDaily:[String] = ["Morning", "Evening"]
    var labelsForEnvironment:[String] = ["Forest", "Ocean"]
    @IBOutlet weak var midView: UIStackView!
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .coverFlow
        view.bounces = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grabUserName(completion: { (name) -> Void in
            self.nameLabel.text = "Hello There, " + name
        })
        midView.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 0, y: 35, width: view.frame.size.width, height: 400)
    }
    
    // number of items exists in the carousel. (Can dynamically change this to number of videos that exist)
    func numberOfItems(in carousel: iCarousel) -> Int {
       return 2
    }
    
    func grabUserName(completion: @escaping(String) -> ()) {
        var nameOfUser = ""
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser!.uid
        let docRef = db.collection("users").document(userID)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                nameOfUser = (document.get("name") ?? "nil") as! String
                completion(nameOfUser)
            } else {
                print("Document does not exist")
            }
        }
    } // end of function
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 400))
         //to this view can add the image and the label
        print(categoryChosen)
        let button = UIButton(frame: view.bounds)
        if (categoryChosen == "situations") {
            button.setImage(UIImage(named: "situations_pic\(index)"), for: .normal)
            button.accessibilityLabel = labelsForSituations[index]
        } else if (categoryChosen == "daily") {
            button.setImage(UIImage(named: "daily_pic\(index)"), for: .normal)
            button.accessibilityLabel = labelsForDaily[index]
        } else {
            button.setImage(UIImage(named: "environment_pic\(index)"), for: .normal)
            button.accessibilityLabel = labelsForEnvironment[index]
        }
        
        //button.setImage(UIImage(named: "pic\(index)"), for: .normal)
        button.addTarget(self , action: #selector(buttonNextAction(sender:)), for: .touchUpInside)
        // button.accessibilityLabel = labelsForSituations[index]
        view.addSubview(button)
        
        //label view
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 21))
        label.font = UIFont(name: "Avenir", size: 17)
        label.center = CGPoint(x: 44, y: 420)
        label.textAlignment = .center
        
        if (categoryChosen == "situations") {
            label.text = labelsForSituations[index] // dynamically change the label text based on the categories
        } else if (categoryChosen == "daily") {
            label.text = labelsForDaily[index] // dynamically change the label text based on the categories
        } else {
            label.text = labelsForEnvironment[index] // dynamically change the label text based on the categories
        }
        
        view.addSubview(label)
        
        return view
    }
    
    // pass the text information to the next page. (Update for more categories that exist) 
    @objc func buttonNextAction(sender: UIButton) {
        if (categoryChosen == "situations") {
            switch sender.accessibilityLabel {
                case labelsForSituations[0]:
                    self.titleOfPage = sender.accessibilityLabel!
                    self.labelOfTitle = "Take some time out during your \r\ncommute for yourself"
                    self.performSegue(withIdentifier: "pageIdentifier", sender: self)
                    break
                case labelsForSituations[1]:
                    self.titleOfPage = sender.accessibilityLabel!
                    self.labelOfTitle = "Start your day by taking time \r\nout for yourself"
                    self.performSegue(withIdentifier: "pageIdentifier", sender: self)
                    break
                default:
                    break
            }// end of switch statement, situations
        } else if (categoryChosen == "daily") {
            switch sender.accessibilityLabel {
                case labelsForDaily[0]:
                    self.titleOfPage = sender.accessibilityLabel!
                    self.labelOfTitle = "Start your day by taking time \r\nout for yourself"
                    self.performSegue(withIdentifier: "pageIdentifier", sender: self)
                    break
                case labelsForDaily[1]:
                    self.titleOfPage = sender.accessibilityLabel!
                    self.labelOfTitle = "Take some time out of your evening \r\nfor yourself"
                    self.performSegue(withIdentifier: "pageIdentifier", sender: self)
                    break
                default:
                    break
            }// end of switch statement, daily
        } else {
            switch sender.accessibilityLabel {
                case labelsForEnvironment[0]:
                    self.titleOfPage = sender.accessibilityLabel!
                    self.labelOfTitle = "Listen to sounds of Forest"
                    self.performSegue(withIdentifier: "pageIdentifier", sender: self)
                    break
                case labelsForEnvironment[1]:
                    self.titleOfPage = sender.accessibilityLabel!
                    self.labelOfTitle = "Listen to sounds of Oceans"
                    self.performSegue(withIdentifier: "pageIdentifier", sender: self)
                    break
                default:
                    break
            }// end of switch statement, environment
        }
    } // end of function 
    
    // pass all the neccessary information to the CommutingViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CommutingViewController
        vc.title1 = self.titleOfPage
        vc.labelForTitle = self.labelOfTitle
        vc.category = self.categoryChosen
        
    }
    
    @IBOutlet weak var situationsButton: UIButton!
    @IBOutlet weak var environmentsButton: UIButton!
    @IBOutlet weak var dailyButton: UIButton!
    
    // change the selected picture based on the option chosen
    @IBAction func situationsButtonClicked(_ sender: Any) {
        situationsButton.setImage(UIImage(named: "selected-situations.png"), for: .normal)
        environmentsButton.setImage(UIImage(named: "environment-1.png"), for: .normal)
        dailyButton.setImage(UIImage(named: "daily=1.png"), for: .normal)
        categoryChosen = "situations"
        myCarousel.reloadData()
    }
    
    @IBAction func environmentsButtonClicked(_ sender: Any) {
        situationsButton.setImage(UIImage(named: "unselected-situations.png"), for: .normal)
        environmentsButton.setImage(UIImage(named: "selected-environment.png"), for: .normal)
        dailyButton.setImage(UIImage(named: "daily=1.png"), for: .normal)
        categoryChosen = "environment"
        myCarousel.reloadData()
    }
    
    @IBAction func dailyButtonClicked(_ sender: Any) {
        situationsButton.setImage(UIImage(named: "unselected-situations.png"), for: .normal)
        environmentsButton.setImage(UIImage(named: "environment-1.png"), for: .normal)
        dailyButton.setImage(UIImage(named: "selected-daily.png"), for: .normal)
        categoryChosen = "daily"
        myCarousel.reloadData()
    }
}

