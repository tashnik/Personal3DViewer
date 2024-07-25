//
//  ContentView.swift
//  Personal3DViewer
//
//  Created by David Potashnik on 7/23/24.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    
    @State private var contentVM = ContentViewVM()
    
    @EnvironmentObject var authentication: Authentication
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
   
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(contentVM.robots) { robot in
                        NavigationLink(value: robot) {
                            Text(robot.name)
                                .foregroundColor(.white)
                                .bold()
                                .font(.subheadline)
                                .padding()
                                .frame(minWidth: 85, maxHeight: 62)
                                .minimumScaleFactor(0.4)
                        }
                        .buttonStyle(BlackButton())
                        .shadow(radius: 6)
                    }
                }
            }
            .padding(.horizontal, 10)
            .navigationTitle("Famous Robots")
            .navigationDestination(for: RobotModel.self) { robot in
                DetailView(robot: robot)
            }
            .ignoresSafeArea(edges: .bottom)
            .toolbar {
                Button {
                    authentication.updateValidation()
                } label: {
                    Text("Log Out")
                }
            }
            .background(Color.gray.opacity(0.04))
        }
        .accentColor(.primary)
    }
}

struct DetailView: View {
    
    var robot: RobotModel
    
    var body: some View {
        SceneView(scene: SCNScene(named: robot.modelName), options: [.allowsCameraControl, .autoenablesDefaultLighting])
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        
        Text(robot.name)
            .font(.title.bold())
            .padding()
        
        Text(robot.description)
            .font(.subheadline)
            .padding(.horizontal)
    }
}

struct BlackButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ContentView()
}
