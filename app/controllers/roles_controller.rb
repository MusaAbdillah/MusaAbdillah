class RolesController < ApplicationController
   before_action :set_role, only: [:show, :edit, :update]

   def index
      @roles = Role.all
      @users = User.all
   end

   def show
      @users = @role.users
   end

   def edit
   end

   # PATCH/PUT /kategoris/1
   # PATCH/PUT /kategoris/1.json
   def update
     respond_to do |format|
       if @role.update(role_params)
         format.html { redirect_to '/roles', flash: { success: "berhasil di perbarui." } }
         format.json { render :show, status: :ok, location: @role }
       else
         format.html { render :edit }
         format.json { render json: @role.errors, status: :unprocessable_entity }
       end
     end
   end

   # DELETE /kategoris/1
   # DELETE /kategoris/1.json



   private
     # Use callbacks to share common setup or constraints between actions.
     def set_role
       @role = Role.find(params[:id])
     end

     # Never trust parameters from the scary internet, only allow the white list through.
     def role_params
       params.require(:role).permit(:nama)
     end

end
