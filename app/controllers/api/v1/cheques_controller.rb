module Api
  module V1
    class ChequesController < ApplicationController
      before_action :set_cheque, only: [:show, :update, :destroy]

      # GET /cheques
      def index
        @cheques = Cheque.active

        render json: ChequeSerializer.new(@cheques).serialized_json
      end

      # GET /cheques/1
      def show
        render json: ChequeSerializer.new(@cheque).serialized_json
      end

      # POST /cheques
      def create
        @cheque = Cheque.new(cheque_params)

        if @cheque.save
          render json: ChequeSerializer.new(@cheque).serialized_json, status: :created, location: @cheque
        else
          render json: @cheque.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /cheques/1
      def update
        if @cheque.update(cheque_params)
          render json: ChequeSerializer.new(@cheque).serialized_json
        else
          render json: @cheque.errors, status: :unprocessable_entity
        end
      end

      # DELETE /cheques/1
      def destroy
        @cheque.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_cheque
        @cheque = Cheque.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def cheque_params
        params.require(:cheque).permit(:name, :date, :value_cents, :status)
      end
    end
  end
end
