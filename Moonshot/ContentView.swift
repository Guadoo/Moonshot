//
//  ContentView.swift
//  Moonshot
//
//  Created by Guadoo on 2021/5/25.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showLaunchDate = false
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44, alignment: .center)
                    VStack(alignment: .leading, spacing: nil, content: {
                        Text(self.showLaunchDate ? mission.displayName : "")
                            .font(.headline)
                        Text(self.showLaunchDate ? "" : mission.formattedLaunchDate)
                    })
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Toggle(isOn: $showLaunchDate, label: {
                Text(self.showLaunchDate ? "Show Date" : "Show Name")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
