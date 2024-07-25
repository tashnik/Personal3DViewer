//
//  RobotModel.swift
//  Personal3DViewer
//
//  Created by David Potashnik on 7/23/24.
//

import Foundation

//This struct needs to contain an id in order for it to iterable and a fileName so that we can load the specified 3D data file.
//I imagine a 3D scan of someones body would require more properties such as waist size, chest circumference, etc.
struct RobotModel: Identifiable, Hashable {
    
    var id: Int
    var name: String
    var fileName: String
    var description: String
}
