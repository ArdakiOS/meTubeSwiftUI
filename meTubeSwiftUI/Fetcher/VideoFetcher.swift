//
//  VideoFetcher.swift
//  meTubeSwiftUI
//
//  Created by Ardak Tursunbayev on 25.05.2023.
//

import Foundation

struct Constants {
    static var url = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=10&playlistId=UULFq3PlGB0_e6jTc9Jr2Al7LQ&key=AIzaSyD3EyyQQdga9HS2GxCz31D3NBZ2ZSQyHDM"
}

class VideoFetcher: ObservableObject {
    
    @Published var videos : [VideoModel] = []
    
    func fetch() {
        guard let url = URL(string: Constants.url) else {return}
        
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {return}
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do{
                let res = try decoder.decode(Response.self, from: data)
                print(res)
                
                DispatchQueue.main.async {
                    self.videos = res.items!
                }
                
            }
            catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
}
