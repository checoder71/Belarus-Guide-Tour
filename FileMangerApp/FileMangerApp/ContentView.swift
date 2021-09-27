//
//  ContentView.swift
//  FileMangerApp
//
//  Created by Dmitriy on 17.07.21.
//

import SwiftUI

struct ContentView: View {
    @State var fileText = ""
    @State var textArray = [String]()
    var body: some View {
        VStack{
            Text("\(textArray.count)")
                .font(.largeTitle).bold()
            Spacer()
            HStack{
                ForEach(0..<textArray.count, id: \.self){ i in
                    VStack{
                        Text(textArray[i])
                        Text("\(i)")
                    }
                }
            }
            Button(action: {
                if let path = Bundle.main.path(forResource: "file", ofType: "txt"){
                    let text = try! String(contentsOfFile: path)
                    textArray = text.components(separatedBy: "\n")
                }
            }, label: {
                Text("Read")
                    .padding()
                    .padding(.horizontal)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .font(.title)
            }).padding()
            Button(action: {
                if let path = Bundle.main.path(forResource: "file", ofType: "txt"){
                    let a = "hello \n hello \n nigga "
                    do {
                        try a.write(toFile: path, atomically: true, encoding: .utf8)
                    } catch {
                        fileText = "niggers"
                    }
                    
                }
            }, label: {
                Text("Write")
                    .padding()
                    .padding(.horizontal)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .font(.title)
            })
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
