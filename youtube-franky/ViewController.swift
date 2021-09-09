//
//  ViewController.swift
//  youtube-franky
//
//  Created by franky on 08/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var video = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Model.getVideo { video, error in
            
            DispatchQueue.main.async {
                self.video = video!
                self.tableView.reloadData()
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return video.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEO_CELL, for: indexPath)
        
        let title = self.video[indexPath.row].title
        
        cell.textLabel?.text = title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}

