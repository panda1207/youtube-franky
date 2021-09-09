//
//  ApiService.swift
//  youtube-franky
//
//  Created by franky on 09/09/2021.
//

import Foundation

class ApiService {
    
    static func getVideo(completion: @escaping (_ response: [Video]?, _ error: Error?) -> Void) {
        
        let url = URL(string: Constants.API_URL)
        
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
                let video = response.items
                completion(video, nil)
            }
            catch {
                completion(nil, error)
                print("\(error)")
            }
        })
        dataTask.resume()
    }
}
