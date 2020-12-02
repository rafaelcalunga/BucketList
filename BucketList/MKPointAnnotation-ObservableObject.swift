//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Rafael Calunga on 2020-12-01.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        
        set {
            self.subtitle = newValue
        }
    }
    
}
