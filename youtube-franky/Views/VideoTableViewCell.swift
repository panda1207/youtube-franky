//
//  VideoTableViewCell.swift
//  youtube-franky
//
//  Created by franky on 09/09/2021.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(_ video: Video) {
        
        self.video = video
        
        guard self.video != nil else{
            return
        }
                
        self.titleLabel.text = video.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video.published)
        
        guard self.video?.thumbnail != nil else{
            return
        }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            self.thumbnailImageView.image = UIImage(data: cachedData)
        }
        
        let url = URL(string: self.video!.thumbnail)
        
        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data!)
                
                if url!.absoluteString != self.video!.thumbnail {
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        dataTask.resume()
    }

}
