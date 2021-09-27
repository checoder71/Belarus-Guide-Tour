//
//  ContentView.swift
//  Belarus Guide
//
//  Created by Dmitriy on 27.09.21.
//

import SwiftUI

var NesvishDesc: String = """
Nesvizh is the small town,\nlocated in the south - west of Minsk Region.\n
It's famous for Nesvizh and Mirskiy Castles.\nA lot of tourists from Belarus, Poland, Russian\n and other countries come here to see\nthe glory of medieval Belarus. There are many parks in the town with any enviroment: tanks, sculptures, wood monuments etc.\n\nNesvizh is worth every second of staying there,\nI'd strongly recommend you to visit this place.

"""

struct PlaceView: View{
    var Name: String
    var Description: String
    var ImageName: String
    @Environment(\.presentationMode) var show
    var body: some View{
        VStack{
            Image(ImageName)
                .resizable()
                .frame(width:350, height: 200)
                .padding(.top)
            Text(Name)
                .bold()
                .font(.largeTitle)
            Text(Description)
        }
    }
}

struct GuideView: View{
    @State var custom = false
    var body: some View{
        NavigationView{
            VStack{
                ZStack{
                    Image("BelarusLocations")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Button(action:{
                        custom.toggle()
                    }){
                        Image("gps").resizable().frame(width: 60, height: 60)
                    }.sheet(isPresented: $custom){
                        PlaceView(Name: "Nesvizh", Description: NesvishDesc, ImageName: "Nesvizh")
                    }.position(x: 150, y: 200)
                }
                Spacer()
                Text("Choose The Place\nYou Want To Visit")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 30)
                Spacer()
            }.navigationBarTitle(Text("Map Of The Country"))
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Text("Belarus Tour")
                        .bold()
                        .font(.system(size: 50))
                    Text("The Most Interesting Places")
                        .font(.title3)
                }
                Image("BelarusMain")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                NavigationLink(destination: GuideView()){
                    Text("Begin")
                        .foregroundColor(.white)
                        .padding(20)
                        .font(.title)
                        .padding(.horizontal, 70)
                        .background(Color.green)
                        .cornerRadius(30)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
