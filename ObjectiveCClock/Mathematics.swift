//
//  Mathematics.swift
//  ObjectiveCClock
//
//  Created by Angelos Staboulis on 25/9/24.
//

import Foundation
import SwiftUI
@objc class Mathematics:NSObject{
    @objc func radiansDegrees(angle:Double)->Double{
        return Angle(degrees: angle).degrees
    }
    @objc func degreesRadians(angle:Double)->Double{
        return Angle(degrees: angle).radians
    }
}
