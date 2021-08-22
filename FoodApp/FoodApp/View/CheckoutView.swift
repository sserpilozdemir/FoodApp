//
//  CheckoutView.swift
//  FoodApp
//
//


import SwiftUI

struct CheckoutView: View {
    @ObservedObject var homeData: HomeViewModel
    var body: some View {
        
        Button(action: homeData.cancelcheckOut) {
            //
            Text("Cancel")
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(Color.orange)
                .cornerRadius(15)
        

        }
        
        Button(action: homeData.updateOrder) {
            //
            Text("Order")
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(Color.orange)
                .cornerRadius(15)
        

        }
    }
}
