
import SwiftUI

struct Home: View {
    
    @StateObject var HomeModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 10) {
                
                HStack(spacing: 15) {
                    
                    Button(action: {
                        
                        withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                        
                    }, label: {
                        Image(systemName: "line.horizontal.3.circle")
                            .font(.title)
                            .foregroundColor(Color.pink)
                        
                    })
                    
                    Text(HomeModel.userLocation == nil ? "Locating..." : "Delivery To")
                        
                        .foregroundColor(.black)
                    
                    Text(HomeModel.userAddress)
                        
                        .font(.caption)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.pink)
                    
                    Spacer(minLength: 0)
                    
                }
                
                .padding([.horizontal, .top])
                
                Divider()
                
                HStack(spacing: 15) {
                    
                    Image(systemName: "magnifyingglass")
                        
                        .font(.title2)
                        .foregroundColor(Color.gray)
                    
                    TextField("Search", text: $HomeModel.search)
                    
                    if HomeModel.search != "" {
                        
                        Button(action: {}, label: {
                            
                        })
                        
                        .animation(.easeIn)
                        
                    }
                    
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                Divider()
                
                if HomeModel.items.isEmpty {
                    
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                }
                
                else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        
                        VStack(spacing: 25){
                            
                            ForEach(HomeModel.filtered){item in
                                
                                //item view
                                
                                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                                    
                                    ItemView(item: item)
                                    
                                    HStack {
                                        
                                        Text("FREE DELIVERY")
                                            
                                            .foregroundColor(.white)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal)
                                            .background(Color.orange)
                                        
                                        Spacer(minLength: 5)
                                        
                                        Button(action: {
                                            HomeModel.addToCart(item: item)
                                        }, label: {
                                            
                                            Image(systemName: item.isAdded ? "checkmark" : "plus")
                                                .foregroundColor(Color.white)
                                                .padding(10)
                                                .background(item.isAdded ? Color.green : Color.orange)
                                                .clipShape(Circle())
                                            
                                        })
                                        
                                    }
                                    .padding(.trailing, 10)
                                    .padding(.top, 5)
                                    
                                })
                                .frame(width: UIScreen.main.bounds.width - 30)
                                
                            }
                            
                        }
                        .padding(.top, 10)
                        
                    })

                }
                
                
            }
            
            //Side Menu.....
            HStack {
                Menu(homeData: HomeModel)
                    //Move Effect From Left
                    .offset(x: HomeModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)

                Spacer(minLength: 0)
            
            }
            .background(
                Color.black.opacity(HomeModel.showMenu ? 0.3 : 0).ignoresSafeArea()
                    //closing when Taps on outside.....
                    .onTapGesture {
                        withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                    })
        
            //Non Closeable Alert If Permission Denied....
            if HomeModel.noLocation {
                Text("Please Enable Location Acces In Settings To Further Move On!!!")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 120)
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3).ignoresSafeArea())
                
            }
        }
        .onAppear(perform: {
            
            HomeModel.locationManager.delegate = HomeModel
            
        })
        .onChange(of: HomeModel.search, perform: { value in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                if value == HomeModel.search && HomeModel.search != "" {
                    
                    HomeModel.filterData()
                    
                }
                
            }
    
            if HomeModel.search == "" {
                
                withAnimation(.linear){HomeModel.filtered = HomeModel.items}
                
            }
            
        })
        
    }
    
}
