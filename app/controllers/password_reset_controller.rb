class PasswordResetController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        redirect_to root_path, notice: 'If an account with that email was found, it should have received an email to reset the password'
    end
    
    def edit
        @user = User.find_signed!(params[:token], purpose:'password_reset')
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to root_path, alert:'Token expired or invalid, please try again!'
    end

    def update 
        @user = User.find_signed!(params[:token], purpose:'password_reset')
        if @user.update(password_params)
            redirect_to sign_in_path , notice: 'Password reset successful, please sign-in!'
        else
            render :edit, status: :bad_request
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end