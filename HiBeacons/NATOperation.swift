//
//  NATOperation.swift
//  HiBeacons
//
//  Created by Nick Toumpelis on 2015-07-26.
//  Copyright (c) 2015 Nick Toumpelis.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import CoreLocation

/// Provides a base class for all the operations that the app can perform.
class NATOperation: NSObject, CLLocationManagerDelegate
{
    /// An instance of CLLocationManager to provide monitoring and ranging facilities.
    lazy var locationManager: CLLocationManager = CLLocationManager()
    // "388891FA-7BB4-4A74-B127-6E240E7151A4" //Radius 1234 - 5555
    // "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0" //Lilipad 1234 - 5678
    

    // The beacon region that will be used as advertisement.
    let adverBeaconRegion: CLBeaconRegion = {
        let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!, identifier: "Identifier2")
        region.notifyEntryStateOnDisplay = true
        return region
    }()

    
//    let beaconRegion: CLBeaconRegion = {
//        let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "388891FA-7BB4-4A74-B127-6E240E7151A4")!, major: 1234, minor: 5555, identifier: "Identifier")
//        region.notifyEntryStateOnDisplay = true
//        return region
//    }()
//    
//    let beaconRegion2: CLBeaconRegion = {
//        let region2 = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!, major: 1234, minor: 5678, identifier: "Identifier2")
//        region2.notifyEntryStateOnDisplay = true
//        return region2
//    }()

    /**
        Sets the location manager delegate to self. It is called when an instance is ready to process location
        manager delegate calls.
     */
    func activateLocationManagerNotifications() {
        locationManager.delegate = self
    }
    
    func getRegions() -> [CLBeaconRegion] {
        var allRegions = [CLBeaconRegion]()
        
        let br1: CLBeaconRegion = {
            let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "388891FA-7BB4-4A74-B127-6E240E7151A4")!, major: 1234, minor: 5555, identifier: "Identifier")
            region.notifyEntryStateOnDisplay = true
            return region
        }()
        allRegions.append(br1)
        
        let br2: CLBeaconRegion = {
            let region2 = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!, major: 1234, minor: 5678, identifier: "Identifier2")
            region2.notifyEntryStateOnDisplay = true
            return region2
        }()
        allRegions.append(br2)
        
        return allRegions
    }
}
