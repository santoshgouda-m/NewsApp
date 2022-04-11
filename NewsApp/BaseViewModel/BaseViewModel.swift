//
//  BaseViewModel.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import Foundation

class BaseViewModel: NSObject{
    
    var coordinator: Coordinator?
    
    init(coordinator: Coordinator?) {
        self.coordinator = coordinator
    }
}
