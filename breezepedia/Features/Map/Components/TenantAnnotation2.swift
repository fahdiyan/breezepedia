//
//  TenantAnnotation2.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 15/05/25.
//

import SwiftUI
import MapKit

class TenantAnnotation2: NSObject, MKAnnotation {
    let tenant: TenantModel2
    var coordinate: CLLocationCoordinate2D { tenant.coordinate }
    var title: String? { tenant.name }
    
    init(tenant: TenantModel2) {
        self.tenant = tenant
    }
}
