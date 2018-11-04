//
//  Locazirator.swift
//  SECRET PHONE
//
//  Created by Mustafa Medeni on 5.08.2018.
//  Copyright © 2018 Mustafa MEDENi. All rights reserved.
//

import Foundation

private class Localizator {
    
    static let sharedInstance = Localizator()
    
    lazy var localizableDictionary: NSDictionary! = {
        if let path = Bundle.main.path(forResource: "Localizable", ofType: "plist") {
            return NSDictionary(contentsOfFile: path)
        }
        fatalError("Localizable file NOT found")
    }()
    
    
    func localize( string: String) -> String {
        
        
        guard let localizedString = localizableDictionary.value(forKey: string) else {
            
            return "localize \(string)"
        }
        if  let value =  (localizedString as AnyObject).value(forKey: "value") as? String {
            
            return value
            
        }
        else{
            
            return "localize \(string)"
            
        }
        
    }
}

extension String {
    var localized: String {
        return Localizator.sharedInstance.localize(string: self)
    }
}
