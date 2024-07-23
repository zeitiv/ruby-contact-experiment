module Api
  class ContactsController < ApplicationController
    def create
      contact_params = params.require(:contact).permit(:name, :email, :message)

      begin
        response = Faraday.post(ENV['WEBHOOK_URL'], contact_params.to_json, 'Content-Type' => 'application/json')
        if response.success?
          render json: contact_params, status: :ok
        else
          # We also send a successful response when the webhook server isn't responding
          # Here it would make sense to somehow safe the response to a db or send a notification manually using email
          render json: contact_params, status: :ok
        end
      rescue => e
        Rails.logger.error("Error: #{e.message}")
        render json: { error: 'Internal server error' }, status: :internal_server_error
      end
    end
  end
end
