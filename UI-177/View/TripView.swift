//
//  TripView.swift
//  UI-177
//
//  Created by にゃんにゃん丸 on 2021/05/08.
//

import SwiftUI

struct TripView: View {
    @State var selectedTab : Trip = trips[0]
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        ZStack{
            
            
            
            GeometryReader{proxy in
                
                let frame = proxy.frame(in:.global)
                
                Image(selectedTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height)
                    .cornerRadius(0)
                
                
            }
            .ignoresSafeArea()
            
            VStack{
                
                Text("Lets Go With")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Pocotrip")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.bottom,30)
                
                VStack{
                    
                    GeometryReader{proxy in
                        
                        let frame = proxy.frame(in:.global)
                        
                        TabView(selection:$selectedTab){
                            
                            ForEach(trips){trip in
                                
                                
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: frame.width - 10, height:frame.height)
                                    .cornerRadius(4)
                                    .tag(trip)
                                
                                
                            }
                            
                            
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                       
                    }
                    .frame(height: getRect().height / 2.2)
                    
                    Text(selectedTab.title)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .padding(.top,20)
                        .padding(.bottom,18)
                    
                    PageController(maxPage: trips.count, currentPage: getIndex())
                   
                }
                
                .padding(.top)
                .padding(.horizontal,10)
                .padding(.bottom,10)
                .background(Color.white.clipShape(CustomShape()))
                .cornerRadius(10)
                
               
                
                
                
                
                NavigationLink(
                    destination: PallaxView(),
                    label: {
                        
                        Text("Palla LaX")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical,10)
                            .padding(.horizontal,25)
                            .background(
                            
                            Capsule()
                                .stroke(Color.white,lineWidth: 5)
                            
                            )
                            .cornerRadius(10)
                            
                        
                        
                   
                    .padding(.top,50)
                        
                    })
                    
                   
                
                
                NavigationLink(
                    destination: TextView(),
                    label: {
                        
                        Text("Muliti Color")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical,10)
                            .padding(.horizontal,25)
                            .background(
                            
                            Capsule()
                                .stroke(Color.green,lineWidth: 5)
                            
                            )
                            .cornerRadius(10)
                            
                        
                        
                   
                    .padding(.top,10)
                       
                    })
                    
                    
               
            }
            .padding()
            
          
            
            
        }
    }
    
    
    func getIndex()->Int{
        
        let index = trips.firstIndex { trip in
            selectedTab.id == trip.id
            
        } ?? 0
        
        return index
        
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView()
    }
}

struct PageController : UIViewRepresentable {
    var maxPage : Int
    var currentPage : Int
    func makeUIView(context: Context) -> UIPageControl {
        
        let controller = UIPageControl()
        controller.backgroundStyle = .minimal
        controller.numberOfPages = maxPage
        controller.currentPage = currentPage
        
        return controller
        
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        uiView.currentPage = currentPage
        
    }
}

struct CustomShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            
            let midWidth = rect.width / 2
            
            path.addLine(to: CGPoint(x: midWidth - 80, y: rect.height))
            
            path.addLine(to: CGPoint(x: midWidth - 70, y: rect.height - 25))
            
            path.addLine(to: CGPoint(x: midWidth + 70, y: rect.height - 25))
            
            path.addLine(to: CGPoint(x: midWidth + 80, y: rect.height))
            
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            
            
            
        }
    }
}
