class Api::V1::SessionsController < Devise::SessionsController
    skip_before_filter :verify_authenticity_token

    def create
        respond_to do |format|
            format.html { super }
            format.json {
                warder.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
                render :status => 200, :json => {:error => "Success" }
            }
        end
    end
    def destroy
        super
    end
end
