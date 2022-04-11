//
//  CustomActivityIndicator.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import UIKit

class CustomActivityIndicator {
    
    public class func showActivityIndicator(inView: UIView) -> UIActivityIndicatorView {
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.center = CGPoint(x: inView.bounds.size.width/2, y: inView.bounds.size.height/2)
        activityIndicator.color = UIColor.gray
        inView.addSubview(activityIndicator)
        inView.bringSubviewToFront(activityIndicator)
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    public class func removeActivityIndicator(activityIndicator:UIActivityIndicatorView) {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}

