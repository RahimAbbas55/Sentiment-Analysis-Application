

import SwiftUI
import AVFoundation

struct MemoryEntry: Identifiable {
    let id = UUID()
    let date: Date
    let text: String
}
class Memory: ObservableObject {
    @Published var entries = [MemoryEntry]()
    
    func addEntry(text: String) {
        entries.append(MemoryEntry(date: Date(), text: text))
    }
}
struct DiaryEntry {
    var diary: String
    var date: String
}



struct ContentView: View {
    @State private var question = ""
    @State private var answer = ""
    @State private var showAnswer = false
    let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Sentiment Analysis App")
                        .font(.system(size: 25, design: .rounded))
                        .bold()
                        .padding()
                }
                HStack {
                    Text("Hi User,")
                        .font(.title)
                        .padding(.leading)
                    Spacer()
                }


                HStack {
                    Text("Add a diary")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding()

                HStack {
                    Image(systemName: "plus")
                        .foregroundColor(.gray)
                        .padding(.leading)
                    TextField("Search memories", text: .constant(""))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding()

                Spacer()

                VStack {
                    
                    NavigationLink(destination: AddDiary ())
                    {
                        Text("Add Diary")
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                    }
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom)

                    
                    NavigationLink(destination: DiaryView()) {
                        Text("Edit Diary")
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                    }
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom)

                    NavigationLink(destination: tutorial()){
                        Text("Tutorials")
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                    }
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .sheet(isPresented: $showAnswer) {
                VStack {
                    Text("Answer to your question:")
                        .font(.headline)
                        .padding()
                    Text(answer)
                        .padding()
                    Button(action: {
                        self.showAnswer = false
                    }) {
                        Text("Close")
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                    }
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding()
                }
            }
        
        }
        
    }
    
}







//-------------------------------------------------------COMPLETED



struct DiaryView: View {
    @State private var searchText = ""
    @State private var diaries = ["2023/01/1", "2023/04/26", "Diary 3", "Diary 4"]

    var body: some View {
        VStack {
            HStack {
                Text("Search Diary")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            .padding()

            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading)
                TextField("Search diaries", text: $searchText)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding()

            Button(action: {
                // Remove selected diary from diaries array
                if let index = diaries.firstIndex(of: searchText) {
                    diaries.remove(at: index)
                    searchText = ""
                }
            }) {
                Text("Remove Diary")
                    .foregroundColor(.white)
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 50)
            }
            .background(Color.gray)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.bottom)

            ScrollView {
                ForEach(diaries, id: \.self) { diary in
                    Text(diary)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
        }
    }
}


struct tutorial: View
{
    var body: some View
    {
       VStack(spacing: 20)
        {
            Text("How To Start?").font(.largeTitle)
                
           HStack(spacing: 20) {
               Button(action: {
                   // Do something when the plus button is tapped
               }) {
                   VStack(spacing: 10) {
                       Image(systemName: "plus")
                           .font(.system(size: 50))
                           .foregroundColor(.white)
                       Text("How to Add Diaries")
                           .foregroundColor(.white)
                           .font(.headline)
                           .multilineTextAlignment(.center)
                   }
               }
               .frame(width: 150, height: 150)
               .background(Color.blue)
               .cornerRadius(25)
               
               Button(action: {
                   // Do something when the book button is tapped
               }) {
                   VStack(spacing: 10) {
                       Image(systemName: "book")
                           .font(.system(size: 50))
                           .foregroundColor(.white)
                       Text("View Diaries")
                           .foregroundColor(.white)
                           .font(.headline)
                           .multilineTextAlignment(.center)
                   }
               }
               .frame(width: 150, height: 150)
               .background(Color.gray)
               .cornerRadius(25)
           }
           
           HStack(spacing: 20) {
               Button(action: {
                   // Do something when the minus button is tapped
               }) {
                   VStack(spacing: 10) {
                       Image(systemName: "minus")
                           .font(.system(size: 50))
                           .foregroundColor(.white)
                       Text("How to Delete Diaries")
                           .foregroundColor(.white)
                           .font(.headline)
                           .multilineTextAlignment(.center)
                   }
               }
               .frame(width: 150, height: 150)
               .background(Color.purple)
               .cornerRadius(25)
               
               Button(action: {
                   // Do something when the magnifying glass button is tapped
               }) {
                   VStack(spacing: 10) {
                       Image(systemName: "magnifyingglass")
                           .font(.system(size: 50))
                           .foregroundColor(.white)
                       Text("How to View Diaries")
                           .foregroundColor(.white)
                           .font(.headline)
                           .multilineTextAlignment(.center)
                   }
               }
               .frame(width: 150, height: 150)
               .background(Color.green)
               .cornerRadius(25)
           }
           }
        
       }
}

struct AddDiary: View {
    @State private var diaryText = ""
    @State private var dateText = ""
    @State private var diaryEntries: [DiaryEntry] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("Enter Diary:")
                TextField("Enter your diary here", text: $diaryText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                Text("Enter Date:")
                TextField("Enter date here", text: $dateText, onCommit: addDiaryEntry)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            NavigationLink(destination: EmotionView()) {
                Text("Enter Current Sentiment")
                    .foregroundColor(.white)
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 50)
            }
            .background(Color.gray)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.bottom)
            
            Divider()
            if !diaryEntries.isEmpty {
                HStack {
                    Text("Diaries")
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 1, height: 30)
                    Text("Date")
                }
                Divider()
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(diaryEntries, id: \.diary) { entry in
                            HStack {
                                Text(entry.diary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: 1, height: 30)
                                Text(entry.date)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    private func addDiaryEntry() {
        guard !diaryText.isEmpty && !dateText.isEmpty else {
            return
        }
        let newEntry = DiaryEntry(diary: diaryText, date: dateText)
        diaryEntries.append(newEntry)
        diaryText = ""
        dateText = ""
    }
}

// N.O.T  N.E.E.D.E.D

struct QuestionView: View
{
    @State private var answer = ""
    @State private var showAnswer = false
    let synthesizer = AVSpeechSynthesizer()
    
    var body: some View{
        
        Button(action: {
            // Do something with the question, like looking up an answer in a database
            self.answer = "This is the answer to your question."
            self.showAnswer = true
        })
        {
        Text("This is the answer to your question.")
            .foregroundColor(.white)
            .bold()
            .frame(maxWidth: .infinity, maxHeight: 50)
    }
    .background(Color.gray)
    .cornerRadius(10)
    .padding(.horizontal)
    .padding(.vertical)
        
        if !answer.isEmpty {
       Button(action: {
           let utterance = AVSpeechUtterance(string: self.answer)
           self.synthesizer.speak(utterance)
       }) {
           Image(systemName: "speaker.wave.2")
               .resizable()
               .aspectRatio(contentMode: .fit)
               .frame(width: 40, height: 40)
               .foregroundColor(.gray)
       }
    }
    }
}

struct EmotionView: View {
    @State private var emotion: String = ""
    
    var body: some View {
        VStack {
            Text("Enter your emotion:")
                .font(.headline)
                .padding()
            
            TextField("Enter emotion here", text: $emotion)
                .padding()
                .foregroundColor(.black)
            
            Spacer()
            Spacer()
            
            if emotion == "Happy"
            {
                Image("happy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 240, height: 250)
                    .padding()
                    .foregroundColor(.yellow)
                    .offset(x: 0, y: -50)
            }
            else if emotion == "Sad"
            {
                Image("sad")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 250)
                    .padding()
                    .foregroundColor(.yellow)
                    .offset(x: 0, y: -50)
            }
            else if emotion == "Tired"
            {
                Image("tired")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
                    .foregroundColor(.red)
                    .offset(x: 0, y: -50)
            }
            else if emotion == "Excited"
            {
                Image("ex")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
                    .foregroundColor(.orange)
                    .offset(x: 0, y: -50)
            }
            else
            {
                Image("confused")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
                    .foregroundColor(.gray)
                    .offset(x: 0, y: -50)
            }
            
            if emotion != "" {
                VStack {
                    Text("Your sentiment of today is:")
                        .font(.headline)
                        .padding()
                    
                    Text("\(emotion)")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.gray)
                .cornerRadius(10)
                .padding()
            }
            
            Spacer()
            Spacer()
        }
        .padding()
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
