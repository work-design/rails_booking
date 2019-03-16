class Booking::TimePlansController < Booking::BaseController
  before_action :set_time_lists
  before_action :set_time_plan, only: [:show, :edit, :update, :destroy]

  def index
    q_params = {}.with_indifferent_access
    q_params.merge! params.permit(:plan_type, :plan_id)
    @time_plans = TimePlan.default_where(q_params).page(params[:page])
  end

  def new
    @time_plan = TimePlan.new(plan_params)
  end

  def create
    @time_plan = TimePlan.new(time_plan_params)

    respond_to do |format|
      if @time_plan.save
        format.html.phone
        format.html { redirect_to booking_time_plans_url, notice: 'Time plan was successfully created.' }
        format.js { redirect_back fallback_location: booking_time_plans_url }
        format.json { render :show }
      else
        format.html.phone { render :new }
        format.html { render :new }
        format.js { redirect_back fallback_location: booking_time_plans_url }
        format.json { render :show }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    @time_plan.assign_attributes(time_plan_params)

    respond_to do |format|
      if @time_plan.save
        format.html.phone
        format.html { redirect_to booking_time_plans_url, notice: 'Time plan was successfully updated.' }
        format.js { redirect_back fallback_location: booking_time_plans_url }
        format.json { render :show }
      else
        format.html.phone { render :edit }
        format.html { render :edit }
        format.js { redirect_back fallback_location: booking_time_plans_url }
        format.json { render :show }
      end
    end
  end

  def destroy
    @time_plan.destroy
    redirect_to booking_time_plans_url, notice: 'Time plan was successfully destroyed.'
  end

  private
  def set_plan
    @plan = params[:plan_type].constantize.find params[:plan_id]
  end

  def set_time_plan
    @time_plan = TimePlan.find(params[:id])
  end

  def set_time_lists
    @time_lists = super || TimeList.none
  end

  def plan_params
    params.permit(:plan_type, :plan_id)
  end

  def time_plan_params
    p = params.fetch(:time_plan, {}).permit(
      :time_list_id,
      :time_item_id,
      :room_id,
      :repeat_type,
      :repeat_days
    )
    p.merge! plan_params
  end

end