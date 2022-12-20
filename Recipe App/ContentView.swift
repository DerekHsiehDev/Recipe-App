//
//  ContentView.swift
//  Recipe App
//
//  Created by Derek Hsieh on 12/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                // placeholder
                
                                AsyncImage(url: URL(string: "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/313342.jpg")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 300)
                                } placeholder: {
                                    ProgressView()
                                }
                Spacer()
            }
            
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.title2)
                            .fontWeight(.regular)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.8), radius: 30)
                                
                            )
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                            .foregroundColor(.black)
                            .font(.title2)
                            .fontWeight(.regular)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.8), radius: 30)
                                
                            )
                        
                    }
                    
                    
                }
                .padding()
                .padding()
                .padding(.top)
                Spacer()
                
                RecipeCard()
            }
            
            
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RecipeCard: View {
    @State private var selectedTab: String = "ingred"
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Rectangle()
                .fill(Color.white)
                .frame(height: (UIScreen.main.bounds.height * 2) / 3)
                .shadow(color: Color.black.opacity(0.9), radius: 3)
                .cornerRadius(10, corners: [.topRight, .topLeft])
            
            
            VStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 60, height: 5)
                    .cornerRadius(10)
                
                HStack {
                    Text("Skirt Steak With Sauce")
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color.black)
                    
                    Spacer()
                    
                    Image(systemName: "clock")
                    Text("30 min")
                }
                .foregroundColor(.secondary)
                .padding(.top, 4)
                
                Text("This flavorful, yet time-saving dish can be made in just under 30 minutes.")
                    .padding(.top, 1)
                
                
                Grid(alignment: .topLeading, horizontalSpacing: 60) {
                    GridRow {
                        NutrientDetailCard(emoji: "🍗", nutrientContent: "32g protein")
                        NutrientDetailCard(emoji: "🧈", nutrientContent: "39g fat")
                    }
                    GridRow {
                        NutrientDetailCard(emoji: "🍫", nutrientContent: "497 kCal")
                        NutrientDetailCard(emoji: "🍡", nutrientContent: "1g sugar")
                    }
                }
                
                HStack(spacing: 0) {
                    Button {
                        self.selectedTab = "ingred"
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(selectedTab == "ingred" ? Color.black : Color.clear)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 20, height: 50)
                            .overlay {
                                Text("Ingredients")
                                    .foregroundColor(selectedTab == "ingred" ? Color.white : Color.black.opacity(0.5))
                                    .fontWeight(.bold)
                            }
                    }
                    
                    Button {
                        self.selectedTab = "instruct"
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(selectedTab == "instruct" ? Color.black : Color.clear)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 20, height: 50)
                            .overlay {
                                Text("Instructions")
                                    .foregroundColor(selectedTab == "instruct" ? Color.white : Color.black.opacity(0.5))
                                    .fontWeight(.bold)
                            }
                    }
                    
                }
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.secondary.opacity(0.2))
                }
                
                if(selectedTab == "ingred") {
                    ScrollView {
                        VStack {
                            ForEach(ingredients, id: \.self) { ingredient in
                                
                                HStack(alignment: .top) {
                                    Text("✅")
                                    Text(ingredient)
                                        .fontWeight(.medium)
                                        .font(.subheadline)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .shadow(color: Color.black.opacity(0.3), radius: 3)
                                }
                                
                            }
                        }
                        .padding(1)
                        .padding(.horizontal ,1)
                    }
                    .frame(height: 225)
              
                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(instructions.indices, id: \.self) { index in
                                HStack(alignment: .top) {
                                    Text("\(index + 1). ")
                                        .bold()
                                    
                                    Text(instructions[index])
                                        .fontWeight(.medium)
                                        .font(.subheadline)
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .shadow(color: Color.black.opacity(0.3), radius: 3)
                                }
                            }
                        }
                        .padding(1)
                        .padding(.horizontal, 1)
                    }
                    .padding(.top)
                    .frame(maxWidth: .infinity)
                    .frame(height: 225)
                    .padding(.bottom)
                }
                
                
            }
            .padding()
            .edgesIgnoringSafeArea(.bottom)
            
        }
    }
}



let ingredients: [String] = [
    "1½ pounds skirt steak, trimmed of excess fat and cut into 3 pieces",
    "1 tablespoon vegetable oil",
    "Freshly ground black pepper, to taste",
    "8 garlic cloves",
    "2 small shallots, halved lengthwise",
]


let instructions: [String] = [
    "Heat a large cast-iron skillet over high heat until it begins to smoke",
    "Brush the steaks with the vegetable oil and season liberally with salt and pepper",
    "Place the steak in the skillet, working in batches as needed. Cook, flipping once halfway through, until charred on the outside and medium-rare inside, 4–8 minutes, depending on the thickness of the steak. If working in batches, wipe out the skillet between batches.",
    "Transfer the steaks to a cutting board and let rest for 10 minutes.",
    "Reduce the heat to medium-high. Add the garlic, shallots, and jalapeño and cook, turning as needed, until blackened in spots and softened, about 8 minutes."
    
]

struct NutrientDetailCard: View {
    var emoji: String // "🍗"
    var nutrientContent: String // "32g protein"
    var body: some View {
        HStack(spacing: 2) {
            Text(emoji)
                .font(.title)
                .padding(7)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.yellow.opacity(0.7))
                )
            Text(nutrientContent)
                .foregroundColor(Color.black.opacity(0.7))
                .bold()
                .font(.headline)
        }
        .fontWeight(.medium)
        .foregroundColor(Color.black.opacity(0.9))
    }
}
