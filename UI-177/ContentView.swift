//
//  ContentView.swift
//  UI-177
//
//  Created by にゃんにゃん丸 on 2021/05/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            TripView()
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
