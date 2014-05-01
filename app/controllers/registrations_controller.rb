class RegistrationsController < Devise::RegistrationsController 
   
    skip_before_filter :verify_authenticity_token

    def create

        @user = User.new(user_params)
=begin
        if @user.save
            render :json => { :state => { :code => 0 }, :data => @user }
        else
            render :json => { :state => { :code => 1, :messages => @user.errors.full_messages } }
        end
=end
        respond_to do |format|
              if @user.save
                format.html { redirect_to @user, notice: 'User was successfully created.' }
                format.json { render action: 'show', status: :created, location: @user }
              else
                format.html { render action: 'new' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
              end
        end
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
