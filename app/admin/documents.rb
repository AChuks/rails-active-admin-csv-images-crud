ActiveAdmin.register Document do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title
  #
  # or
  #
  # permit_params do
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index :download_links => [:csv, :document, :json, :xml] do
    selectable_column
    column :id
    column :title
    column :file_name
    actions
  end

  form do |f|
    f.semantic_errors 
    f.inputs "Upload a New Document" do
      f.input :title
      f.input :data, as: :file
    end
    f.actions
  end

  show do |document|
    panel "Document Details" do
      render 'document_view_partial', context: self 
    end
    active_admin_comments
  end

  csv do
    column :id
    column :title
    column :file_name 
  end

  controller do

    def process_file
      @document.title = document_params[:title]
      if !document_params[:data].nil?
        @document[:file_name] = document_params[:data].original_filename
        @document[:data] = document_params[:data].read
        @document.size = document_params[:data].size
        @document.file_type = File.extname(@document.file_name)
      end
    end

    def show
      @document = Document.find_by(id: params[:id])
      @document.file_type = File.extname(@document.file_name)
      if @document.file_type == '.csv' 
        @csv = CSV.parse(@document[:data]);
        @headers = @csv[0]
        @data = @csv[1..-1]
      else 
        @data = @document[:data]
      end
    end

    def create

      @document = Document.new
      process_file
      if @document.save
        redirect_to admin_document_path(@document)
      else
        render :new
      end
    end

    def update

      @document = Document.where(id: params[:id]).first!
      process_file
      if @document.save
        redirect_to admin_document_path(@document)
      else
        render :edit
      end
    end

    private
      def document_params
        params.require(:document).permit(:title, :file_name, :data, :file_type)
      end
  end
end
