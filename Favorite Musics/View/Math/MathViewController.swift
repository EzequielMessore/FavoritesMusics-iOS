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
    
    let searchResult = "ResultCell"
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var musicArray = [Music]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.searchBar.delegate = self;
        
        tableView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        
        let cellNib = UINib(nibName: searchResult, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: searchResult)
        
        tableView.rowHeight = 80
        
        searchBar.becomeFirstResponder()
    }
    
    func showNetworkError() {
        let alert = UIAlertController(
            title: NSLocalizedString("Whoops...", comment: "Error alert: title"),
            message: NSLocalizedString("There was an error reading from the iTune Store. Please try again.", comment: "Error alert: message"),
            preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func search() {
        
        MusicService.instance.getMusics(musicName: searchBar.text!, completionHandler: {(musicsArray, success, error) in
            if success {
                print("Success")
                if let array = musicsArray {
                    self.musicArray = array;
                    self.tableView.reloadData()
                    print(self.musicArray)
                }
            } else {
                print("Failure")
            }
        })
        
        searchBar.resignFirstResponder()
    }
}

extension MathViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search()
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension MathViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: searchResult, for: indexPath) as! ResultCell
        let music = musicArray[indexPath.row]
        cell.bind(for: music)
        return cell
    }
}

extension MathViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
}
