class IndexController < ApplicationController
  before_action :callback # Example of using filters across all methods in controller
  after_action  :callback # Example of using filters

  # GET /samples
  # GET /samples.json
  def index
    @samples = Sample.all
    puts @samples.inspect # Example of inspecting an object/hash and outputting to console
    options = {}
    options[:is_collection]
    render json: SampleSerializer.new(@samples, options).serialized_json
  end

  # GET /samples/1
  # GET /samples/1.json
  def show
    @sample = Sample.find(index_params[:id])

    render json: SampleSerializer.new(@sample).serialized_json
  end

  # GET /samples/new
  # GET /samples/new.json
  def new
    @sample = Sample.new

    render json: SampleSerializer.new(@sample).serialized_json
  end

  # GET /samples/1/edit
  def edit
    @sample = Sample.find(index_params[:id])

    render json: SampleSerializer.new(@sample).serialized_json
  end

  # POST /samples
  # POST /samples.json
  def create
    puts index_params.inspect
    @sample = Sample.new(index_params)

    if @sample.save
      render json: SampleSerializer.new(@sample).serialized_json
    else
      render json: @sample.error, status: :unprocessable_entity
    end
  end

  # PUT /samples/1
  # PUT /samples/1.json
  def update
    @sample = Sample.find(index_params[:id])

    if @sample.update_attributes(index_params[:string_data])
      head :no_content
    else
      render json: @sample.error, status: :unprocessable_entity
    end
  end

  # DELETE /samples/1
  # DELETE /samples/1.json
  def destroy
    @sample = Sample.find(index_params[:id])
    @sample.destroy

    head :no_content
  end

  private
    def callback
      puts "Filters fire before/around/after any method is called."
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def index_params
     params.require(:index).permit(:id,
                                  :string_data,
                                  :text_data,
                                  :json_data,
                                  :boolean_data,
                                  :integer_data)
    end
end
