//
//  ContentView.swift
//  Image Picker
//
//  Created by Md Sifat on 2/26/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showImagePicker : Bool = false
     @State private var image : Image? = nil
    var body: some View {
        NavigationView{
            VStack{
                image?.resizable().padding().scaledToFit().foregroundColor(Color.orange)
                Button(action: {
                    self.showImagePicker = true
                }) {
                    Text("Open Camera")
                }.padding().foregroundColor(.white).background(Color.purple)
            }.sheet(isPresented: self.$showImagePicker) {
                PictureCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
            }.navigationBarTitle(Text("Image Picker"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ImagePicker : UIViewControllerRepresentable{
    @Binding var show: Bool
    @Binding var image: Image?
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCoordinate {
        return ImagePickerCoordinate(show: $show, image: $image)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
}

class ImagePickerCoordinate: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var show : Bool
    @Binding var image : Image?
    
    init(show: Binding<Bool>, image: Binding<Image?>){
        _show = show
        _image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image = Image(uiImage: uiImage)
        show = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        show = false
    }
}
