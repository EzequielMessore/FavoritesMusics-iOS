//
//  Music.swift
//  Favorite Musics
//
//  Created by Ezequiel Messore on 04/09/17.
//  Copyright © 2017 Ezequiel Messore. All rights reserved.
//

import Foundation

class Music {
    var trackName: String = ""
    var artistName: String = ""
    var photo: String = ""
    
    init(trackName: String, artistName: String, photo: String) {
        self.trackName = trackName
        self.artistName = artistName
        self.photo = photo
    }
    
}
