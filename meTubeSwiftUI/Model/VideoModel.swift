//
//  VideoModel.swift
//  meTubeSwiftUI
//
//  Created by Ardak Tursunbayev on 25.05.2023.
//

import Foundation

struct Response : Decodable {
    var items : [VideoModel]?
    
    
    enum CodingKeys: CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decodeIfPresent([VideoModel].self, forKey: .items)
    }
}

struct VideoModel : Decodable, Hashable {
    let videoId : String
    let thumbnail : String
    let desc: String
    let published : Date
    let title : String
    
    
    enum CodingKeys: String, CodingKey {
        case videoId
        case thumbnail = "url"
        case desc = "description"
        case published = "publishedAt"
        case title
        
        case snippet
        case thumbnails
        case high
        case resourceId
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        let thumbContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        let resContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        self.desc = try snippetContainer.decode(String.self, forKey: .desc)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        self.videoId = try resContainer.decode(String.self, forKey: .videoId)
        
    }
}


