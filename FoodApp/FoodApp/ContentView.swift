//
//  ContentView.swift
//  FoodApp
//
//
import SwiftUI


struct ContentView: View {
    @EnvironmentObject var authentication: Authentication
    var body: some View {
        
        NavigationView {
            
            Home()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
