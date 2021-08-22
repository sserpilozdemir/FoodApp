//
//  Menu.swift
//  Food Ordering App
//
//

import SwiftUI

struct Menu: View {
    @EnvironmentObject var authentication: Authentication
    @ObservedObject var homeData : HomeViewModel
    var body: some View {
        
        VStack {
            
            NavigationLink(destination: CartView(homeData: homeData)) {
                                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(Color.pink)
                        
                        Text("Cart")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        
                        Spacer(minLength: 0)
                    }
                    .padding()
                }

            Spacer()
            
            HStack {
                Spacer()
                
                Text("Version 0.1")
                    .fontWeight(.bold)
                    .foregroundColor(Color.pink)
                Button("Sign Out") {
                    authentication.isValidated=false
                }

            }
            
            .padding(10)
        }
        .padding([.top,.trailing])
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.white.ignoresSafeArea())

    }
}


/*
 //
 //  Menu.swift
 //  Food Ordering App
 //
 //

 import SwiftUI

 struct Menu: View {
     
     @ObservedObject var homeData : HomeViewModel
     var body: some View {
         
         VStack {
             
             NavigationLink(destination: CartView(homeData: homeData)) {
                                     
                     HStack(spacing: 15) {
                         
                         Image(systemName: "cart")
                             .font(.title)
                             .foregroundColor(Color.pink)
                         
                         Text("Cart")
                             .fontWeight(.bold)
                             .foregroundColor(Color.black)
                         
                         Spacer(minLength: 0)
                     }
                     .padding()
                 }

             Spacer()
             
             HStack {
                 Spacer()
                 
                 Text("Version 0.1")
                     .fontWeight(.bold)
                     .foregroundColor(Color.pink)

             }
             
             .padding(10)
         }
         .padding([.top,.trailing])
         .frame(width: UIScreen.main.bounds.width / 1.6)
         .background(Color.white.ignoresSafeArea())

     }
 }


 */
