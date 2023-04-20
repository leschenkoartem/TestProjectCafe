//
//  CustomTextField.swift
//  TestProject
//
//  Created by Artem Leschenko on 19.04.2023.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    
    
    var body: some View {
        HStack {
            HStack{
                TextField("Search...", text: $text)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .foregroundColor(Color(.label).opacity(0.5))
                
                Button {
                    text.removeAll()
                } label: {
                    Image(systemName: text != "" ? "xmark": "magnifyingglass").foregroundColor(Color(.label).opacity(0.5))
                }
            }.padding(12)
                .background()
                .cornerRadius(12)
                .padding(.top, 10)
                .padding(.horizontal, 10)
                .shadow(radius: 8, y: 5)
            
        }
    }
}
struct CustomTextField_Previews: PreviewProvider {
    @State static var a = ""
    static var previews: some View {
        CustomTextField(text: $a)
    }
}
