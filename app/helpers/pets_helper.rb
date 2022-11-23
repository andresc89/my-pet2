module PetsHelper
  def image_cloudinary(pet)
    if pet.photo.attached?
      cl_image_path pet.photo.key, crop: :fill
    else
      image_tag "placeholder.jpg"
    end
  end
  def image_cloudinary_tag(pet)
    if pet.photo.attached?
      cl_image_path pet.photo.key
    else
      image_tag "placeholder.jpg"
    end
  end
end
