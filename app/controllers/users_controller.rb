class UsersController < ApplicationController
   def new
      @user = User.new
   end

   def create
      @user = User.new(user_params)
      if @user.save
         redirect_to user_path(@user)
      else
         render :new, alert: "Invalid input"
      end
   end

   def show
      @user = User.find_by_id(params[:id])
   end


   private
      def user_params
         params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
      end
end