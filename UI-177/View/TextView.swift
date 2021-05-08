//
//  TextView.swift
//  UI-177
//
//  Created by にゃんにゃん丸 on 2021/05/08.
//

import SwiftUI

var gra = LinearGradient(gradient: .init(colors: [.red,.green]), startPoint: .leading, endPoint: .trailing)

struct TextView: View {
    @State var multiColor = false
    var body: some View {
        VStack{
            
            TextShiemer(title: "Kavsoft", multiColor: $multiColor)
                .shadow(color: .purple, radius: 5, x: 5, y: 5)
            
            TextShiemer(title: "Swift UI", multiColor: $multiColor)
                .shadow(color: .red, radius: 5, x: 5, y: 5)
            
            TextShiemer(title: "Master", multiColor: $multiColor)
                .shadow(color: .green, radius: 5, x: 5, y: 5)
                .shadow(color: .green, radius: 5, x: -5, y: -5)
            
            Toggle(isOn: $multiColor, label: {
                
                Text("Enable MultiColor")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .shadow(color: .white, radius: 10, x: 5, y: 5)
                
            })
            .padding(.top,50)
                
                .preferredColorScheme(.dark)
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}

struct TextShiemer : View {
    var title : String
    @Binding var multiColor : Bool
    @State var animation = false
    
    var body: some View{
        
        ZStack{
            
            Text(title)
                .font(.system(size: 70, weight: .heavy))
                .foregroundColor(.white)
            
            HStack(spacing:0){
                
                
                ForEach(0..<title.count,id:\.self){index in
                    
                    Text(String(title[title.index(title.startIndex,offsetBy : index)]))
                        .font(.system(size: 70, weight: .heavy))
                        .foregroundColor(multiColor ? RandomColor() : .white)
                    
                    
                }
            }
            .mask(
            Rectangle()
                
                .fill(gra)
                .rotationEffect(.init(degrees: 70))
                .padding(20)
                .offset(x: -250)
                .offset(x: animation ? 500 : 0)
                
                
                
                
                
                    
                
               
            
            )
            .onAppear(perform: {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)){
                    
                    
                    animation.toggle()
                }
            })
        }
        
    }
    func RandomColor()->Color{
        
        let color = UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        return Color(color)
        
        
    }
    
}
