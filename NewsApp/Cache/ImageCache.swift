//
//  Cache.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import Foundation
import UIKit


class ImageCache {
    static let shared = ImageCache()
    
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
    
}

