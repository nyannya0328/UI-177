//
//  PallaxView.swift
//  UI-177
//
//  Created by にゃんにゃん丸 on 2021/05/08.
//

import SwiftUI

struct PallaxView: View {
    @State var selected : Int = 1
    var body: some View {
        TabView(selection:$selected){
            
             
            ForEach(1...8,id:\.self){index in
                
                
               
                    
                    GeometryReader{reader in
                        
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: getRect().width, height: getRect().height / 2)
                            .offset(x: -reader.frame(in: .global).minX)
                        
                    }
                    .frame(height: getRect().height / 2)
                    .cornerRadius(15)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: -5, y: -5)
                    .padding(.horizontal,25)
                    .overlay(
                    
                    
                    
                    
                    Image("p\(selected)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .offset(x: -25, y: -15)
                        ,alignment: .bottomTrailing
                   
                   )
                    
                    
                
            }
            
           
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
        .ignoresSafeArea()
    }
}

struct PallaxView_Previews: PreviewProvider {
    static var previews: some View {
        PallaxView()
    }
}
extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}
