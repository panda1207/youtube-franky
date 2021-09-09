//
//  Model.swift
//  youtube-franky
//
//  Created by franky on 09/09/2021.
//

import Foundation

class Model {
    
    static func getVideo(completion: @escaping (_ response: Response?, _ error: Error?) -> Void) {
        
        let url = URL(string: "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLMRqhzcHGw1ZkH8RuznGMS0NZs0jWQQ5a&key=AIzaSyB7_mg39rTIr4l2f5cv2L52d1A1cUqjnSc")
        
        guard url != nil else {
            print("URL not found")
            return
        }
    
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: { data, response, error in
            
            if error != nil || data == nil {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
                completion(response, nil)
            }
            catch {
                completion(nil, error)
                print("\(error)")
            }
        })
        dataTask.resume()
    }
}
