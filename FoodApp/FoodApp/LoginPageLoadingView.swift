//
//  LoginPageLoadingView.swift
//  FoodApp
//
//

import SwiftUI

struct LoginPageLoadingView: View {
    var body: some View {
        
        VStack {
            LottieView(filename: "35625-food-choose")
                .frame(width: 300, height: 300)
        }

    }
}

struct LoginPageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageLoadingView()
    }
}

