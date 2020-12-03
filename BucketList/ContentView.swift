//
//  ContentView.swift
//  BucketList
//
//  Created by Rafael Calunga on 2020-11-23.
//

import SwiftUI
import MapKit
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var showingEditScreen = false

    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: createNewLocation) {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        .alert(isPresented: $showingPlaceDetails) {
            Alert(
                title: Text(selectedPlace?.title ?? "Unknown"),
                message: Text(selectedPlace?.subtitle ?? "Missing place information."),
                primaryButton: .default(Text("OK")),
                secondaryButton: .default(Text("Edit")) {
                    self.showingEditScreen = true
                }
            )
        }
        .sheet(isPresented: $showingEditScreen) {
            if self.selectedPlace != nil {
                EditView(placemark: self.selectedPlace!)
            }
        }
    }
    
    func createNewLocation() {
        let newLocation = CodableMKPointAnnotation()
        newLocation.title = "Example Location"
        newLocation.coordinate = self.centerCoordinate
        self.locations.append(newLocation)
        
        self.selectedPlace = newLocation
        self.showingEditScreen = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
