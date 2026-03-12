//
//  LocationMapAnnotionView.swift
//  SwiftUIMapApp
//
//  Created by Zohidjon on 10/03/26.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack (spacing: 0) {
            Image(systemName: "map.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(5)
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(x: 0, y: -4)
                .padding(.bottom, 40)
        }
//        .background(Color.blue)
    }
}

#Preview {
    ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        
        LocationMapAnnotationView()
    }
}
