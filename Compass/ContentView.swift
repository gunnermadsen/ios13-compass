//
//  ContentView.swift
//  Compass
//
//  Created by gunner madsen on 8/11/20.
//  Copyright © 2020 Gunner Madsen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var compassHeading = CompassHeading()
    
    var body: some View {
        VStack {
            Capsule()
                .frame(width: 5, height: 50)
            ZStack {
                ForEach(Marker.markers(), id: \.self) { marker in
                    CompassMarkerView(marker: marker, compassDegress: 0)
                }
                .frame(width: 300, height: 300)
                .rotationEffect(Angle(degrees: self.compassHeading.degrees))
                .statusBar(hidden: true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
