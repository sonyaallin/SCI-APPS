//
//  YoutubeViewController.swift
//  Mindfulness
//
//  Created by Rahul Jasani on 2022-03-02.
//

import youtube_ios_player_helper
import UIKit
import Firebase
import FirebaseAuth

class YoutubeViewController: UIViewController {
    let db = Firestore.firestore()
    
    @IBOutlet weak var playerView: YTPlayerView!
    @IBOutlet weak var like: UIButton!
    @IBOutlet weak var unlike: UIButton!
    var finalVideoIdOfVideo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.load(withVideoId: finalVideoIdOfVideo)
        let userID = Auth.auth().currentUser!.uid
        print(userID)
    }
    
    // liking the video
    @IBAction func likePressed(_ sender: Any) {
        let userID = Auth.auth().currentUser!.uid
        let docRef = db.collection("users").document(userID)
        docRef.updateData([
            "favourites": FieldValue.arrayUnion([finalVideoIdOfVideo])
        ])
        
        // Create a new alert
        let dialogMessage = UIAlertController(title: "Note", message: "You have liked the video!", preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    
    // unliking the video
    @IBAction func unlikePressed(_ sender: Any) {
        let userID = Auth.auth().currentUser!.uid
        let docRef = db.collection("users").document(userID)
        docRef.updateData([
            "favourites": FieldValue.arrayRemove([finalVideoIdOfVideo])
        ])
        
        // Create a new alert
        let dialogMessage = UIAlertController(title: "Note", message: "You have disliked the video!", preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
}
