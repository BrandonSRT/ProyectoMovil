//
//  RegisterView.swift
//  Proyecto
//
//  Created by user204403 on 10/14/21.
//

import SwiftUI
import SDWebImageSwiftUI
struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var profileImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var imageData: Data = Data()
    @State private var showingImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error:String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh no :("
    
    
    func loadImage(){
        guard let inputImage = pickedImage else{return}
        profileImage = inputImage
    }
    
    func errorCheck() -> String?{
        if email.trimmingCharacters(in: .whitespaces).isEmpty ||
            password.trimmingCharacters(in: .whitespaces).isEmpty ||
            username.trimmingCharacters(in: .whitespaces).isEmpty ||
            imageData.isEmpty{
            return "Please Fill in all fields and provide an image"
        }
        return nil
    }
    func clear(){
        self.email = ""
        self.username = ""
        self.password = ""
        self.imageData = Data()
        self.profileImage = Image(systemName: "person.circle.fill")
    }
    
    
    func signUp(){
        if let error = errorCheck(){
            self.error = error
            self.showingAlert = true
            return
        }
        
        AuthService.signUp(username: username, email: email, password: password, imageData: imageData, onSuccess: {
            (user) in
            self.clear()
        }){
            (errorMessage) in
            print("Error \(errorMessage)")
            self.error = errorMessage
            self.showingAlert = true
            return
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                WebImage(url: URL(string: "https://fdn.gsmarena.com/imgroot/news/18/03/instagram-timeline-changes/-728/gsmarena_001.jpg")!)
                    .resizable()
                    .frame(width: 250, height: 200, alignment: .trailing)
//                VStack(alignment: .leading){
//                    Text("Welcome").font(.system(size: 32,weight: .heavy))
//                    Text("Sign UP to Starts").font(.system(size: 16,weight: .medium))
//                }
                
                VStack{
                    
                    Group{
                        
                        if profileImage != nil {
                            profileImage!.resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                                .padding(.top, 20)
                                .onTapGesture(){
                                    self.showingActionSheet = true
                                }
                        
                        }else{
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width:100, height:100)
                                .padding(.top, 20)
                                .onTapGesture {
                                    self.showingActionSheet = true
                                }
                            Text("Add photo +")
                        }
                    }
                }
                
                Group{
                    Login(value: $username, icon: "person.fill", placeholder: "Username")
                    Login(value: $email, icon: "envelope.fill", placeholder: "E-mail")

                    Login(value: $password, icon: "lock.fill", placeholder: "Password", isSecure: true)

                }
                    Button(action: signUp){
                        Text("Sign Up").font(.title)
                            .modifier(LoginModifiers())
                        
                    }.alert(isPresented: $showingAlert){
                        Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
                    }
                    
                    
                
            }.padding()
        }.sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
