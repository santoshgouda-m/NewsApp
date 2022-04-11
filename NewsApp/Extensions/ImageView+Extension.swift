//
//  ImageView+Extension.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImagesUsingURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        image = nil
        if let imageFromCache = ImageCache.shared.get(forKey: urlString) {
            self.image = imageFromCache
            return
        }
        
//        if CacheMemory.shared.urlCache.contains(urlString) {
//            return
//        }
//        CacheMemory.shared.urlCache.append(urlString)
        
        URLSession.shared.dataTask(with: url) { (data, respone, error) in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async {
                let imageCache = UIImage.init(data: data!)
                ImageCache.shared.set(forKey: urlString, image: imageCache ?? UIImage())
                self.image = imageCache
            }
        }.resume()
    }
}

extension UIColor {
    func getImage(size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
