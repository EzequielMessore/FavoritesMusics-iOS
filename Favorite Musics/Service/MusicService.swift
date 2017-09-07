//
//  MusicService.swift
//  Favorite Musics
//
//  Created by Ezequiel Messore on 05/09/17.
//  Copyright © 2017 Ezequiel Messore. All rights reserved.
//

import Foundation
import Alamofire

class MusicService {
    let BASEURL = "https://itunes.apple.com"
    let ENDPOINT = "/search?resultEntity=music&country=BR&"
    let TERMS = "term="
    
    static 	let instance = MusicService()
    
    private let manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    func getMusics(musicName:String ,completionHandler: @escaping (_ music: [Music]?, _ success: Bool, _ error: Error?) -> ()) {
        manager.request(BASEURL + ENDPOINT + TERMS + musicName).validate().responseJSON { (response) in
            debugPrint(response)
            
            //to get status code
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    print("example success")
                default:
                    print("error with response status: \(status)")
                    completionHandler(nil, false, response.error!)
                }
            }
            
            guard response.result.isSuccess else {
                print(response.result.isFailure.description)
                completionHandler(nil, false, response.error!)
                return
            }
            
            //remove mock
            var musicArray = [Music]()
            
            for index in 1...5 {
                let m = Music(trackName: "Track \(index)", artistName: "Artist \(index)", photo: "Teste \(index)")
                musicArray.append(m)
            }
            completionHandler(musicArray, true, nil)
            
            
            //to get JSON return value
            guard let responseJSON = response.result.value as? [String: Any],
                let list = responseJSON["results"] as? [String: Any] else {
                    print("Invalid information received from the service")
                    completionHandler(nil, false, nil)
                    return
            }
            
            debugPrint(list)
            
//            for musicDictionary in list {
//                if let m = Music.parseToMusic(dictionary: musicDictionary) {
//                    musicArray.append(m)
//                }
//            }
            
            //completionHandler(musicArray, true, nil)
        }
    }
}
