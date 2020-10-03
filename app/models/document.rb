class Document < ActiveRecord::Base

    attr_accessor :size, :file_type
    before_save :check_file_format_size

    validates :title, presence: true
    validates :data, presence: true
    validates :file_type, presence: true


    def check_file_format_size
        # Accepted file formats
        unless ['.csv', '.jpg', '.gif', '.png', '.jpeg'].include? file_type
            errors.add(:data, "Unsupported file format. Please upload only csv's and images")
            throw(:abort)
        end
        # Accepted file size (< 20MB)
        unless size < 20971520
            errors.add(:data, "File is too big. Please upload a file less than 20MB")
            throw(:abort)
        end
    end
end
