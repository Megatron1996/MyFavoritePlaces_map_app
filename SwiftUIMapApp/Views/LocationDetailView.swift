////
////  LocationDetailView.swift
////  SwiftUIMapApp
////
////  Created by Zohidjon on 11/03/26.
////

import SwiftUI
import MapKit
struct LocationDetailView: View {
    @EnvironmentObject private var  vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        ScrollView{
            
            VStack{
                imageSection
                    .shadow(
                        color: Color.black.opacity(0.4),
                        radius: 20,
                        x: 0,
                        y: 10)
                VStack(alignment: .leading, spacing: 16){
                    titleSection
                    Divider()
                    discriptionSection
                    Divider()
                    maplayer
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea(.all)
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topLeading)
        .foregroundColor(Color.black)

    }
        
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}
extension LocationDetailView {
    private var imageSection: some View{
        TabView{
            ForEach(location.imageNames, id: \.self){
                ImageNmae in Image(ImageNmae)
                    .resizable()
                    .scaledToFill()
                   
                }
            }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    private var titleSection: some View{
        VStack (alignment: .leading, spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    private var discriptionSection: some View{
        VStack (alignment: .leading, spacing: 16){
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            if let url = URL(string: location.link){
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    private var maplayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems: [location]) {location in MapAnnotation(
                coordinate: location.coordinates) {
                                   LocationMapAnnotationView()
                        .shadow(radius: 10)
                }
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
    private var backButton: some View{
        Button {
            vm.sheetLocation = nil
        } label: {Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .background(.ultraThickMaterial)
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 20)
                .padding()
            
        }
    }
}
