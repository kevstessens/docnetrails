# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(params[:user])
    patient=Patient.new()
    patient.user=@user
    patient.prepaid_medical_id=params[:user][:prepaid_medical_id]
    @user.patient = patient

    if @user.save
      patient.save
      #clientinfo.save
      #address.save
      #NewUserMailer.new_user_email(@user).deliver

      if @user.active_for_authentication?
        sign_in("user", @user)
        respond_with @user, :location => after_sign_up_path_for(@user)

      else
        expire_session_data_after_sign_in!
        respond_with @user, :location => after_inactive_sign_up_path_for(@user)
      end
    else
      clean_up_passwords @user
      redirect_to new_user_registration_path(:registration => false)
    end
  end

end