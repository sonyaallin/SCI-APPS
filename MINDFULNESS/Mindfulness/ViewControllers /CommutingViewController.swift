//
//  CommutingViewController.swift
//  Mindfulness
//
//  Created by Rahul Jasani on 2022-03-04.
//
import UIKit
import Firebase

class CommutingViewController: UIViewController {

    let db = Firestore.firestore()
    var videoIdOfVideo = ""
    var title1 = ""
    var labelForTitle = ""
    var category = "" 
    
    @IBOutlet weak var titleOfPage: UILabel!
    @IBOutlet weak var labelOfTitle: UILabel!
    
    @IBOutlet weak var video1: UIButton!
    @IBOutlet weak var video2: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleOfPage.text = title1
        self.labelOfTitle.text = labelForTitle
    }
    
    @IBAction func video1Pressed(_ sender: Any)
    {
        let docRef = db.collection(category).document(title1)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.get("video1") ?? "nil"
                self.videoIdOfVideo = dataDescription as! String
                self.performSegue(withIdentifier: "youtubeIdentifier", sender: self)
            } else {
                print("Document does not exist")
            }
        }
    }
    
    @IBAction func video2Pressed(_ sender: Any)
    {
        let docRef = db.collection(category).document(title1)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.get("video2") ?? "nil"
                self.videoIdOfVideo = dataDescription as! String
                self.performSegue(withIdentifier: "youtubeIdentifier", sender: self)
            } else {
                print("Document does not exist")
            }
        }
    }
    
    // --------------- helper method to retrieve all the url for the videos ---------------
//    func retrieveUrl(_ address:String) {
//        let docRef =  db.collection("situations").document("Busy Day")
//        sleep(5)
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.get(address) ?? "nil"
//                self.videoIdOfVideo = dataDescription as! String
//                print("self " + self.videoIdOfVideo)
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! YoutubeViewController
        vc.finalVideoIdOfVideo = self.videoIdOfVideo
    }
}
