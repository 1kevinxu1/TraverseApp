class Api::UserInterestsController < Api::ApiController
  def create
    @interest = Interest.find_or_create_by(name: capitalized_name)
    @user_interest =
      UserInterest.new(user_id: current_user.id, interest_id: @interest.id)
    @user_interest.save!
    render json: @user_interest
  end

  def destroy
    UserInterest.find(params[:id]).destroy
    render json: ["#{params[:id]} destroyed"]
  end

  private

  def capitalized_name
    params[:name].split(" ").map{ |word| word.capitalize}.join(" ")
  end
end
