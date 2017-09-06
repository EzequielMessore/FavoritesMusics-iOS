//
//  MathViewController.swift
//  Favorite Musics
//
//  Created by Ezequiel Messore on 04/09/17.
//  Copyright © 2017 Ezequiel Messore. All rights reserved.
//

import UIKit
import Alamofire

class MathViewController: UIViewController {

    var musicArray = [Music]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Math"
        
        MusicService.instance.getMusics { (musicsArray, success, error) in
            if success {
                print("Success")
                if let array = musicsArray {
                    self.musicArray = array;
                    print(self.musicArray)
                }
            } else {
                print("Failure")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
