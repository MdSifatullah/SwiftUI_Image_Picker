//
//  PictureCaptureView.swift
//  Image Picker
//
//  Created by Md Sifat on 2/26/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import SwiftUI

struct PictureCaptureView: View {
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    var body: some View {
        ImagePicker(show: $showImagePicker, image: $image)
    }
}

struct PictureCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureCaptureView(showImagePicker: .constant(false), image: .constant(Image("")))
    }
}
