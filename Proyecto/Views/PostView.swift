//
//  PostView.swift
//  Proyecto
//
//  Created by user204403 on 10/21/21.
//

import SwiftUI

struct PostView: View {
    
    @State private var postImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var imageData: Data = Data()
    @State private var showingImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error:String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh no :("
    @State private var text = ""
    
    func loadImage(){
        guard let inputImage = pickedImage else{return}
        postImage = inputImage
    }
    func uploadPost(){
        if let error = errorCheck(){
            self.error = error
            self.showingAlert = true
            return
        }
        self.clear()
            //Firebase
    }

    
    func clear(){
        self.text = ""
        self.imageData = Data()
        self.postImage = Image(systemName: "photo.fill")
    }
    
    func errorCheck() -> String?{
        if text.trimmingCharacters(in: .whitespaces).isEmpty ||
            imageData.isEmpty{
            return "Please add a caption and provide an image"
        }
        return nil
    }
    
    var body: some View {
        VStack{
            Text("Upload A post").font(.largeTitle)
            
            VStack{
                if postImage != nil {
                    postImage!.resizable()
                        .frame(width: 300, height: 300)
                        .onTapGesture(){
                            self.showingActionSheet = true
                        }
                }else{
                    Image(systemName: "photo.fill").resizable()
                        .frame(width: 300, height: 300)
                        .onTapGesture(){
                            self.showingActionSheet = true
                        }

                }
            }
            TextEditor(text: $text)
                .frame(height: 200)
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black))
                .padding(.horizontal)
            
            Button(action: uploadPost){
                Text("Upload Post").font(.title).modifier(LoginModifiers())
            }.alert(isPresented: $showingAlert){
                Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
            }
            
        }.padding()
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
                ImagePicker(pickedImage: self.$pickedImage, showImage: self.$showingImagePicker, imageData: self.$imageData)

            }.actionSheet(isPresented: $showingActionSheet){
                ActionSheet(title: Text(""), buttons:[
                    .default(Text("Choose a photo")){
                        self.sourceType = .photoLibrary
                        self.showingImagePicker = true
                    },
                    .default(Text("Take A Photo")){
                        self.sourceType = .camera
                        self.showingImagePicker = true
                        
                    }, .cancel()])
            }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
