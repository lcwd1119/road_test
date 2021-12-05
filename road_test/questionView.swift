//
//  questionView.swift
//  road_test
//
//  Created by 廖晨維 on 2021/12/5.
//

import SwiftUI

struct lawquestionView: View {
    let question:Question_law
    var body: some View {
        Section{
            VStack(alignment: .leading,spacing: 20) {
                Text(question.q)
                Text("正解:\(question.ans)")
            }.padding()
        }
    }
}

struct lawquestionView_Previews: PreviewProvider {
    static let demolaw = Question_law(q: "下列何種違規行為得對汽車所有人逕行舉發處罰：\n\n(1)無照駕駛。\n(2)酒醉駕車。\n(3)違規停車而駕駛人不在場。", ans: 3)
    static var previews: some View {
        lawquestionView(question: demolaw)
    }
}

struct markquestionView: View {
    let question:Question_mark
    var body: some View {
        Section{
            VStack(alignment: .leading,spacing: 20) {
                question.q
                .resizable()
                .frame(width: 300, height: 300)
                Text(question.t)
                Text("正解:\(question.ans)")
            }.padding()
        }
    }
}

struct markquestionVieww_Previews: PreviewProvider {
    static let demomark = Question_mark(q: Image("question_mark1"),t:"圖中白色虛線為：\n\n(1)轉彎線。\n(2)網狀線。\n(3)槽化線。", ans: 1)
    static var previews: some View {
        markquestionView(question: demomark)
    }
}
