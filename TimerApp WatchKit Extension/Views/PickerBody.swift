//
//  PickerBody.swift
//  TimerApp WatchKit Extension
//
//  Created by Erik Flores on 21/9/21.
//

import SwiftUI

struct PickerBody: View {
    var data: ClosedRange<Int>

    var body: some View {
        ForEach(data, id: \.self) { item in
            if item < 10 {
                Text("0\(item)").tag(item)
            } else {
                Text("\(item)").tag(item)
            }
        }
    }
}

struct PickerBody_Previews: PreviewProvider {
    static var previews: some View {
        PickerBody(data: (0...59))
    }
}
