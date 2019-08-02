//
//  MASSquareMenuView.swift
//  masq
//
//  Created by 翁培钧 on 2019/8/2.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct MASSquareMenuView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello World!")
                .foregroundColor(.white)
            Text("Hello World!")
                .foregroundColor(.white)
            Text("Hello World!")
            .foregroundColor(.white)
        }
            .background(Color.black)
    }
}

#if DEBUG
struct MASSquareMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MASSquareMenuView()
    }
}
#endif
