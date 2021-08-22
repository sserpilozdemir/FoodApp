//
//  CartView.swift
//  Food Ordering App
//
//

import SwiftUI
import SDWebImageSwiftUI

struct CartView: View {
    @ObservedObject var homeData: HomeViewModel
    @State var shouldNavigate = false
    @Environment(\.presentationMode) var present
    var body: some View {
        
        VStack {
            
            HStack(spacing: 20) {
                
                Button(action: {present.wrappedValue.dismiss()}) {
                    
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(.black)
                        .foregroundColor(Color.orange)
                    
                }
                
                Text("My cart")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer()
                
            }
            
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack(spacing: 0) {
                    
                    ForEach(homeData.cartItems) { cart in
                        
                        HStack(spacing: 15) {
                            
                            WebImage(url: URL(string: cart.item.item_image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 130, height: 130)
                                .cornerRadius(15)
                            
                            
                            /// frame parameters
                            ///   - minWidth: The minimum width of the resulting frame.
                            ///   - idealWidth: The ideal width of the resulting frame.
                            ///   - maxWidth: The maximum width of the resulting frame.
                            ///   - minHeight: The minimum height of the resulting frame.
                            ///   - idealHeight: The ideal height of the resulting frame.
                            ///   - maxHeight: The maximum height of the resulting frame.
                            ///   - alignment: The alignment of this view inside the resulting frame.

                            
                            VStack(alignment: .leading, spacing: 50) {
                                
                                Text(cart.item.item_name)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                
                                Text(cart.item.item_details)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                                
                                HStack(spacing: 15) {
                                    
                                    Text(homeData.getPrice(value: Float(truncating: cart.item.item_cost)))
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                    
                                    Spacer(minLength: 0)
                                    
                                    Button(action: {
                                        
                                        if cart.quantity > 1 {
                                            
                                            homeData.cartItems[homeData.getIndex(item: cart.item, isCartIndex: true )].quantity -= 1
                                            
                                        }
                                        
                                    }) {
                                        
                                        Image(systemName: "minus")
                                            .font(.system(size: 16, weight: .heavy))
                                            .foregroundColor(.black)
                                        
                                    }
                                    
                                    Text("\(cart.quantity)")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.black)
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, 10)
                                        .background(Color.black.opacity(0.06))
                                    
                                    Button(action: {
                                        
                                        homeData.cartItems[homeData.getIndex(item: cart.item, isCartIndex: true)].quantity += 1
                                        
                                    }) {
                                        
                                        Image(systemName: "plus")
                                            .font(.system(size: 16, weight: .heavy))
                                            .foregroundColor(.black)
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        .padding()
                        .contentShape(RoundedRectangle(cornerRadius: 15))
                        .contextMenu(){
                            
                            Button(action: {
                                
                                let index = homeData.getIndex(item: cart.item, isCartIndex: true)
                                let itemIndex = homeData.getIndex(item: cart.item, isCartIndex: false)
                                let filterIndex = homeData.filtered.firstIndex { (item1) -> Bool in
                                    return cart.item.id == item1.id
                                    
                                } ?? 0
                                homeData.items[itemIndex].isAdded = false
                                homeData.filtered[filterIndex].isAdded = false
                                
                                homeData.cartItems.remove(at: index)
                                
                            }) {
                                Text("Remove")
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            VStack {
                
                HStack{
                    
                    Text("Total")
                        
                        .fontWeight(.heavy)
                        .foregroundColor(.orange)
                    
                    Spacer()
                    
                    Text(homeData.calculateTotalPrice())
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                }
                
                .padding([.top, .horizontal])
                
                Text("")
                    .overlay(NavigationLink(
                    destination: CheckoutView(homeData: homeData),
                        isActive: $homeData.checkOutReady) {
                        
                    }
                    .hidden())
                
                Button(action: homeData.checkOut) {
                    //
                    Text(homeData.ordered ? "Cancel Order" : "Check out")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.orange)
                        .cornerRadius(15)
                

                }
//                Button(action: homeData.updateOrder){
//                    Text("Check out")
//                        .font(.title2)
//                        .fontWeight(.heavy)
//                        .foregroundColor(.white)
//                        .padding(.vertical)
//                        .frame(width: UIScreen.main.bounds.width - 30)
//                        .background(Color.orange)
//                        .cornerRadius(15)
//
//                    shouldNavigate = true
//                }
                
            }
            .background(Color.white)
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
    
}
