//
//  Welcome.swift
//  Error Nil
//
//  Created by Junling Guan on 7/6/2023.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        VStack {
            Image("logo3")
                .resizable()
                .frame(width: 260, height: 260, alignment: .bottom)
            Text("Touch anywhere to start")
                .font(.system(size: 30,  weight: .bold))
                .foregroundColor(.black)
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
            .previewDevice("iPhone 14 Pro")
    }
}
