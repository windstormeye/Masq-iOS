//
//  ContentView.swift
//  masq
//
//  Created by PJHubs on 2019/7/4.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var showingInputView = false
    
    var inputButton: some View {
            Button(action: { self.showingInputView.toggle() }) {
                Image(systemName: "square.and.pencil")
                    .imageScale(.large)
                    .padding()
            }
        }
    
    var body: some View {
        NavigationView {
            List {
                BlogNormalCellView()
                BlogLinkCellView()
                BlogFlagCellView()
                BlogNormalCellView()
                BlogNormalCellView()
                BlogFlagCellView()
                BlogLinkCellView()
            }
                .navigationBarTitle(Text("广场"))
                .navigationBarItems(leading:
                    Button(action: {
                    
                    }, label: {
                        Image(systemName: "list.dash")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                    }) , trailing:
                    Button(action: {
                        self.showingInputView.toggle()
                    }, label: {
                        Image(systemName: "square.and.pencil")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                    })
                )
                .sheet(isPresented: $showingInputView) {
                    InputView()
                }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().environment(\.colorScheme, .dark)
        }
    }
}
#endif

struct BlogNormalCellView : View {
    var body: some View {
        return HStack(alignment: .top) {
            Image("4")
                .resizable()
                .frame(width: 50.0, height: 50.0)
                .background(Color.blue)
                .cornerRadius(40)
            
            VStack(alignment: .leading) {
                Text("10-21 17:28")
                    .foregroundColor(.secondary)
            Text("自由就是合理地控制可以利用的资源；控制的方法越合理，可用资源越丰富，使用这种控制方法的人越多——自由的程度就越高。")
                    .foregroundColor(.primary)
                    .lineLimit(nil)
                    .frame(maxHeight: 100)
            }
        }
    }
}

struct BlogLinkCellView : View {
    var body: some View {
        return HStack(alignment: .top) {
            Image("1")
                .resizable()
                .frame(width: 50.0, height: 50.0)
                .background(Color.red)
                .cornerRadius(40)
            
            VStack(alignment: .leading) {
                Text("10-21 17:28")
                    .foregroundColor(.secondary)
            Text("烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！烦死啦！")
                    .foregroundColor(.primary)
                    .lineLimit(nil)
                    .frame(maxHeight: 100)
                
                HStack {
                    Image(systemName: "link")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.blue)
                        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                        .background(Color("blogCellIconColor"))
                    
                    Text("海上城市")
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .foregroundColor(.secondary)
                        .font(Font.system(size: 15))
                    Spacer()
                }
                    .border(Color(red: 200/255, green: 200/255, blue: 200/255), width: 1, cornerRadius: 5)
            }
        }
    }
}

struct BlogFlagCellView : View {
    var body: some View {
        return HStack(alignment: .top) {
            Image("6")
                .resizable()
                .frame(width: 50.0, height: 50.0)
                .background(Color.yellow)
                .cornerRadius(40)
                
            VStack(alignment: .leading) {
                Text("10-21 17:28")
                    .foregroundColor(.secondary)
            Text("毕业快乐，有缘再见！")
                    .foregroundColor(.primary)
                    .lineLimit(nil)
                    .frame(maxHeight: 100)
            
                HStack {
                        Image(systemName: "flag.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.red)
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                            .background(Color("blogCellIconColor"))
                        
                    Text("春天去奈良旅游")
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .foregroundColor(.secondary)
                        .font(Font.system(size: 15))
                    
                    Spacer()
                }
                    .border(Color(red: 200/255, green: 200/255, blue: 200/255), width: 1, cornerRadius: 5)
            }
        }
    }
}
