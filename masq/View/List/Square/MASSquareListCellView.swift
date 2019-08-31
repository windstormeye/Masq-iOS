//
//  MASSquareListCell.swift
//  masq
//
//  Created by 翁培钧 on 2019/7/31.
//  Copyright © 2019 PJHubs. All rights reserved.
//

import SwiftUI


struct MASSquareNormalCellView : View {
    
    var article: Article
    
    var body: some View {
        HStack(alignment: .top) {
            MASAvatarView(avatarImage: Int(article.avatarImage),
                          avatarColor: Int(article.avatarColor))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(String.date())
                    .font(Font.system(size: 15))
                    .foregroundColor(.secondary)
                
                Text("\(article.content)")
                    .foregroundColor(.primary)
                    .lineLimit(5)
            }
//            .frame(minHeight: 50, maxHeight: 200)
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
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255)))
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
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255)))
            }
        }
    }
}
