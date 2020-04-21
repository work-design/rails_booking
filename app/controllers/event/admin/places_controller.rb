class Event::Admin::PlacesController < Event::Admin::BaseController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    q_params = {}
    q_params.merge! default_params
    q_params.merge! params.permit(:name, 'max_members-gte')
    @places = Place.default_where(q_params).page(params[:page])
  end

  def new
    @place = Place.new
    @place.place_taxon = PlaceTaxon.new(default_params)
  end

  def create
    @place = Place.new(place_params)

    unless @place.save
      render :new, locals: { model: @place }, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @place.place_taxon ||= PlaceTaxon.new(default_params)
  end

  def update
    @place.assign_attributes(place_params)

    unless @place.save
      render :edit, locals: { model: @place }, status: :unprocessable_entity
    end
  end

  def destroy
    @place.destroy
  end

  private
  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    p = params.fetch(:place, {}).permit(
      :name,
      :color,
      :place_taxon_ancestors
    )
    p.merge! default_form_params
  end

end
