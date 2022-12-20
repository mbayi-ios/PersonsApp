//
//  CheckMarkView.swift
//  PersonsApp
//
//  Created by Amby on 20/12/2022.
//

import SwiftUI

struct CheckMarkView: View {
    var body: some View {
        Symbols.checkmark
            .font(.system(.largeTitle, design: .rounded).bold())
            .padding()
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct CheckMarkView_Previews: PreviewProvider {
    static var previews: some View {
        CheckMarkView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.blue)
    }
}
