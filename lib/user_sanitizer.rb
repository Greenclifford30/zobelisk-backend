class User::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def account_update
        default_params.permit(	:first_name,
        						:last_name,
        						:email,
        						:password,
        						:password_confirmation,
        						:current_password,
        						:dob,
        						:phone,
        						:address,
        						:twitter,
        						:picture,
        						:avatar_file_name,
        						:avatar_content_type,
        						:avatar_file_size,
        						:avatar_updated_at )
    end
end
