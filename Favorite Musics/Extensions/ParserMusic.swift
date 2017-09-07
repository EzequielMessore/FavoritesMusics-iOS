//
//  ParserMusic.swift
//  Favorite Musics
//
//  Created by Ezequiel Messore on 05/09/17.
//  Copyright © 2017 Ezequiel Messore. All rights reserved.
//
import Foundation

extension Music {
    
    public func getArrayOfMusics(from json: [Any]) -> [Music] {
        
        var musicResults: [Music] = []
        
        for resultDict in json {
            if let resultDict = resultDict as? [String: Any] {
                musicResults.append(parseToMusic(track: resultDict)!)
            }
        }
        return musicResults
    }
    
    public func parseToMusic(track dictionary: [String: Any]) -> Music? {
        
        guard let trackName = dictionary["trackName"] as? String,
            let artistName = dictionary["artistName"] as? String,
            let artworkUrl60 = dictionary["artworkUrl60"] as? String
            else {
                print("Could not parse json music")
                return(nil)
        }
        return Music.init(trackName: trackName, artistName: artistName, photo: artworkUrl60)
    }
}
