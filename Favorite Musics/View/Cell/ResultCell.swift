//
//  ResultCell.swift
//  Favorite Musics
//
//  Created by Ezequiel Messore on 06/09/17.
//  Copyright © 2017 Ezequiel Messore. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    
    @IBOutlet weak var imageMusic: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    
    @IBOutlet weak var artist: UILabel!
    
    private var downloadTask: URLSessionDownloadTask?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        downloadTask?.cancel()
        downloadTask = nil
    }
    
    func bind(for music: Music){
        self.musicName.text = music.trackName
        self.artist.text = music.artistName
        //imageMusic.image = UIImage(named: "Placeholder")
        
//        if let imageUrl = URL(string: music.photo) {
//            downloadTask = imageMusic.loadImage(url: imageUrl)
//        }
    }
    
}
