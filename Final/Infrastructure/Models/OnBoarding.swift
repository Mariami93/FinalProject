//
//  Info.swift
//  TeamWork
//
//  Created by Mariami on 7/5/21.
//

import Foundation

struct OnBoarding: Codable {
    var title: String?
    var imageUrl: String?
    var text: String?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case text = "text"
        case imageUrl = "image_url"
    }
    
}
