//
//  ContentViewVM.swift
//  Personal3DViewer
//
//  Created by David Potashnik on 7/23/24.
//

import Foundation
import Observation

@Observable
class ContentViewVM {
    
    var robots = [RobotModel(id: 24, name: "T-800", modelName: "robot.usdz", description: "He's a Terminator."),
                  RobotModel(id: 25, name: "T-1000", modelName: "robot.usdz", description: "He's the gooey Terminator."),
                  RobotModel(id: 26, name: "R2-D2", modelName: "robot.usdz", description: "Belongs to Obi-Wan."),
                  RobotModel(id: 27, name: "C-3PO", modelName: "robot.usdz", description: "R2D2's BFF."),
                  RobotModel(id: 28, name: "Optimus Prime", modelName: "robot.usdz", description: "Changes into a truck."),
                  RobotModel(id: 29, name: "Megatron", modelName: "robot.usdz", description: "Changes into a gun."),
                  RobotModel(id: 30, name: "HAL", modelName: "robot.usdz", description: "This level of artificial Intelligence is a quality that, thankfully, does not exist in our modern technology."),
                  RobotModel(id: 31, name: "Bishop", modelName: "robot.usdz", description: "He prefers the term Artificial Person."),
                  RobotModel(id: 32, name: "KITT", modelName: "robot.usdz", description: "The smooth-talking, self-driving muscle car from the early '80s TV drama Knight Rider was so cool, it even upstaged David Hasselhoff."),
                  RobotModel(id: 33, name: "The Iron Giant", modelName: "robot.usdz", description: "This 100-foot-tall combat machine from the 1999 movie wields an energy cannon and snacks on cars.")]
}
