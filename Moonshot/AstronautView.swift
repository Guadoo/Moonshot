//
//  AstronautView.swift
//  Moonshot
//
//  Created by Guadoo on 2021/5/27.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Text("Flow on: ")
                        .font(.title)
                    ForEach(missions, id: \.id) { mission in
                        ForEach(mission.crew, id: \.self) { member in
                            if astronaut.id == member.name {
                                Text(mission.displayName)
                                    .font(.headline)
                            }
                        }
                    }
                }
                
                Spacer(minLength: 25)
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    
    static let astronauts:[Astronaut] = Bundle.main.decode("astronauts.json")
    
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
