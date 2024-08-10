//
//  ContentView.swift
//  PinImageTest
//
//  Created by Gakkie Gakkienl on 10/08/2024.
//

/*
 CASE:
        Enable the user tp pin images (symbols) to an Image (pixel coordinates)
        The pins must stay in the correct place when panning and zooming and
        also when the screen estate changes by rotating, or split screen and slide
        over on Ipads. Pins can be placed at every zoom lvel and must stay in place when zooming and panning
        Lastly the pins (symbols) must be tapable!
        Preferably the pins are placed using a long press gesture! iOS17+ preferred, but 18+ is also OK!
 SCENARIO 1:
        ContentView + PinchAndZoomModifier (custom)
        Basicly this works as intended, with one caveat: The pins are not tapable
        because the custom modifier uses an overlay. Setting .allowsHitTesting(false)
        on the overlay makes the pins tapable, but disables pinching and zooming.
        The zooming in/out could be smoother.
        Also not the preferred solution, because it is not SwiftUI only!
 SOLUTION:
        None ?
 */

import SwiftUI

let arrowPointUp = Image(systemName: "arrowtriangle.up.fill")

struct ContentView: View {
    @State private var mapImage = UIImage(named: "worldMap")!
    @State private var tapLocation = CGPoint.zero
    //@State private var height = 0.0
    //@State private var width = 0.0

    var body: some View {
        //GeometryReader { proxy in
            
            ZStack {
                Image(uiImage: mapImage)
                    .resizable()
                    .fixedSize()
                
                // Add Pin
                mapImagePinSmall()
                    .foregroundColor(.green)
                    .position(tapLocation)
                
                // Test pins
                mapImagePinSmall()
                    .foregroundColor(.red)
                    .position(x: 776, y: 1150)

                mapImagePinSmall()
                    .foregroundColor(.blue)
                    .position(x: 1178, y: 1317)
            }
            .onAppear {
                print("image size", mapImage.size)
            }
            .frame(width: mapImage.size.width, height: mapImage.size.height)
//            .scaledToFit()
//            .clipShape(Rectangle())
            .PinchToZoomAndPan(contentSize: mapImage.size, tapLocation: $tapLocation)
//            }
        //}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
